1. Fish Installation

```
ln -s ~/dotfiles/fish-config ~/.config/fish

brew install fish  
curl -L https://get.oh-my.fish | fish
```

2. Change Shell 

On intel mac
```
sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish
```

On Apple Silicon Mac
```
sudo bash -c 'echo /opt/homebrew/bin/fish  > /etc/shells'
chsh -s /opt/homebrew/bin/fish
```

3. Install omf themes
```
omf install batman
```

4. Additional setup

 - dependencies setup
   ```
   omf install bass
   ```
 - run the following command for all node related commands to work
   ```
   omf install https://github.com/fabioantunes/fish-nvm
   ```


5. Meta key mapping in mac
The alt key would not work as expected by default in fish shell and neovim.

We configure Meta key to Left alt key.
`ITerm2 -> Preferences -> Profiles -> keys -> General -> Choose "left Option key " as "Esc+"`

Note: This is needed for neovim key mapping which makes lines move up and down to work.


