1. Create a symlink

```
mkdir -p ~/.config/nvim/
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
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

4. Install Universal-ctags (not exuberant-ctags)
```
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```
Note: Tagbar works better with universal-ctags without any additional setup

5. Install ripgrep
```
brew install ripgrep
```

6. Install Nerd fonts
  - Follow the instructions [here](https://github.com/ryanoasis/nerd-fonts) to install the fonts or specific font.
  - In Iterm2, under profiles, pick the font "DroidSansMono Nerd Font"

7. Install additional dependencies
```
pip3 install --user jedi --upgrade #needed for deoplete
```

To manually install dein plugins, use this inside nvim
```
:call dein#install()
```

8. Language Server & Client setup
  1. Rust - Install rustup and rls component `rustup component add rls`
  2. Go - Install `gopls`
  3. Python - Install 'pyls"
  4. JS / TS/ TSX/ JSX - Install `typescript-language-server` and use correct node version. Refer the `init.vim` config file.
  5. Docker - Install `npm install -g dockerfile-language-server-nodejs`
