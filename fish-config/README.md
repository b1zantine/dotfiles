1. Fish Installation

```
ln -s ~/dotfiles/fish-config ~/.config/fish

brew install fish  
curl -L https://get.oh-my.fish | fish
sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish

```

2. Install omf
```
curl -L https://get.oh-my.fish | fish

omf install bobthefish
omf install bass
```