1. Create a symlink

```
ln -s ~/dotfiles/nvim-config/init.vim ~/.config/nvim/init.vim
```

2. Install pynvim
```
pip3 install --user pynvim
```

3. Open Vim & install dein

```
:call dein#install()
```
