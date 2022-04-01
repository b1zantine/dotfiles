1. Create a symlink

```
ln -s ~/dotfiles/nvim-config/init.vim ~/.config/nvim/init.vim
```

2. Install neovim
```
brew install neovim
pip3 install --user pynvim
```

3. Install dein
```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
```

4. Install ctags
```
brew install ctags
```

5. Install ripgrep
```
brew install ripgrep
```

6. Install Powerline fonts
  - Follow the instructions [here](https://github.com/powerline/fonts) to install the fonts.
  - In Iterm2, under profiles, pick the font "Droid Sans Mono for Powerline" 

To manually install dein plugins, use this inside nvim
```
:call dein#install()
```

