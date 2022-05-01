# dotfiles


1. Setup Git config
   ```
   ln -s ~/dotfiles/gitconfig ~/.gitconfig
   ```

2. Setup fish shell by following instructions in fish Readme file
3. Setup neovim by following instructions in nvim Readme file

4. Setup Firefox customization (for tree style tabs)
    1. Install [tree style tabs plugin](https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/)
    2. Go to [about:addons](about:addons) -> Extensions -> Tree Style Tabs ->
        Preferences -> Advanced -> Load from files -> Pick the file `~/dotfiles/firefox/treesytletab.css`
    3. To hide horizontal toolbar, first go to [about:config](about:config) ->
        set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`
    4. Find Profiles folder. Go to [about:profiles](about:profiles) -> Under `Profile: default`, there will be a box that says `Root Directory`
    5. Create soft link
        `ln -s ~/dotfiles/firefox/chrome ~/Library/Application\ Support/Firefox/Profiles/5iueezxj.default-release/chrome`
        [Ref1](https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules)
        [Ref2](https://gist.github.com/eizedev/f0a65275859b16e2649656d2e283dc81)
