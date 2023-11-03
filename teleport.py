#!/usr/bin/env python

import json
import logging
import os
import shlex
import signal
import subprocess
import sys
import threading
import time
from pathlib import Path
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

"""
Dependencies:
1. watchdog - `pip install watchdog`
2. rsync - `brew install rsync`

Config file example: 
{
    "repos": [
        {
            "source": "/Users/ssudar/workspace/avi-dev/",
            "destinations": [
                "aviuser@10.102.96.94:~/avi-dev/"
            ],
            "excludedPaths": [
                "build"
            ]
        },
        ...
    ]
}
"""
CONF_FILE_REL_PATH = "~/.config/teleport.config"

exit_event = threading.Event()

class RepoRsyncEventHandler(FileSystemEventHandler):
    def __init__(self, repo=None, delay=1.0):
        super().__init__()
        self._repo = repo

        self._delay = delay # debounce delay
        self._timer = None  # debounce timer

    def _debounce(self, func, *args, **kwargs):
        """
        Delay the actual syncing until there's a pause in the stream of events.
        """
        if self._timer is not None:
            self._timer.cancel() # Cancel the previous timer if it's still pending
        self._timer = threading.Timer(self._delay, func, args, kwargs)
        self._timer.start()

    def _filter_out(self, event):
        return (Path(event.src_path).resolve() == Path(self._repo['source']).resolve()) \
                or (Path(event.src_path).resolve() == Path(os.path.join(self._repo['source'], '.git')))

    def dispatch(self, event):
        if self._filter_out(event):
            return
        
        # logging.info(f"DETECTED CHANGES - {self._repo['source']}")
        # logging.info(f"{event.event_type} -- {event.src_path} -- {event.is_synthetic}")

        super().dispatch(event)
        self._debounce(sync_repo, self._repo)

def signal_handler(sig, frame):
    logging.warning("Received SIGTERM. Exiting...")
    exit_event.set()

def load_config():
    conf_file_abs_path = os.path.expanduser(CONF_FILE_REL_PATH)
    try:
        # Try to open the JSON file for reading
        with open(conf_file_abs_path, 'r') as file:
            # Try to load the JSON data from the file
            config = json.load(file)
    except FileNotFoundError:
        logging.error(f"Error: The file {conf_file_abs_path} does not exist.")
        sys.exit(1)
    except PermissionError:
        logging.error(f"Error: Permission denied to read the file {conf_file_abs_path}.")
        sys.exit(1)
    except json.JSONDecodeError:
        logging.error(f"Error: The file {conf_file_abs_path} does not contain valid JSON.")
        sys.exit(1)
    except Exception as e:
        # Catch any other exceptions
        logging.error(f"An unexpected error occurred: {e}")
        sys.exit(1)
    
    return config

def listen_events(repo):
    logging.info(f"Started watching changes to {repo['source']} ...")
    event_handler = RepoRsyncEventHandler(repo=repo)
    observer = Observer()
    observer.schedule(event_handler, repo['source'], recursive=True)
    observer.start()
    try:
        while not exit_event.is_set():
            time.sleep(1)
    finally:
        observer.stop()
        observer.join()
        logging.info(f"Stopped watching changes to {repo['source']} ...")

def sync_repo(repo):
    excludeParams = ''
    if "excludedPaths" in repo:
        excludeParams = ' '.join(["--exclude=" + s for s in repo['excludedPaths']])

    for destination in repo['destinations']:
        # gitExcludes = '--exclude=.git/index.lock --exclude=.git/HEAD.lock --exclude=.git/refs/*/*.lock --exclude=.git/objects/pack/tmp_pack_*'
        cmd = f"rsync -az --no-owner --no-group --delete {excludeParams} --exclude=.git/ {repo['source']} {destination}"

        logging.info(f"SYNCING {repo['source']} to {destination} . . .")
        subprocess.call(shlex.split(cmd))
        logging.info(f"SYNCED {repo['source']} to {destination}")

def teleport():
    config = load_config()
    event_listener_threads = list()

    # Do an initial sync of all repos before listening for events
    for repo in config["repos"]:
        sync_repo(repo)

    logging.info("Starting to listen for changes to repos ...")
    for repo in config["repos"]:
        thread = threading.Thread(target=listen_events, args=(repo,))
        event_listener_threads.append(thread)
        thread.start()

    try:
        for thread in event_listener_threads:
            thread.join()
    except KeyboardInterrupt:
        logging.warning("Received keyboard interrupt. Exiting...")
        exit_event.set()

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO,
                        format='%(asctime)s - %(message)s',
                        datefmt='%Y-%m-%d %H:%M:%S')
    
    signal.signal(signal.SIGTERM, signal_handler)
    
    print("""
  _______     _____   __        _____  __ __     _____     __ __     _______   
/\_______)\ /\_____\ /\_\     /\_____\/_/\__/\  ) ___ (   /_/\__/\ /\_______)\ 
\(___  __\/( (_____/( ( (    ( (_____/) ) ) ) )/ /\_/\ \  ) ) ) ) )\(___  __\/ 
  / / /     \ \__\   \ \_\    \ \__\ /_/ /_/ // /_/ (_\ \/_/ /_/_/   / / /     
 ( ( (      / /__/_  / / /__  / /__/_\ \ \_\/ \ \ )_/ / /\ \ \ \ \  ( ( (      
  \ \ \    ( (_____\( (_____(( (_____\)_) )    \ \/_\/ /  )_) ) \ \  \ \ \     
  /_/_/     \/_____/ \/_____/ \/_____/\_\/      )_____(   \_\/ \_\/  /_/_/     
                                                                               
""")
    teleport()
