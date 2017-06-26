dotfiles
=========

### Build Instructions

1. Build vim using the instructions given in BUILD.md

2. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

3. Setup Powerline fonts
- Install [powerline fonts](https://github.com/powerline/fonts)
- Select `Inconsolata-g for Powerline (font: 11)` in Terminal Preferences menu

4. Create symlinks
```
  ln -s ~/dotfiles/vim-config/vimrc ~/.vimrc
  ln -s ~/dotfiles/zsh-config/zshrc ~/.zshrc
```