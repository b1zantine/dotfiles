call dein#add('Shougo/deoplete.nvim')                   "autocomplete
call dein#add('deoplete-plugins/deoplete-jedi')
call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})

call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('honza/vim-snippets')

call dein#add('vim-syntastic/syntastic')                "to highlight syntax

call dein#add('Shougo/denite.nvim')                     "alternative for unite.vim
"call dein#add('neoclide/denite-git')

"Fuzzy finder
call dein#add('junegunn/fzf', { 'path': '~/.fzf/', 'build': './install --all' })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

"LanguageClient
call dein#add('autozimu/LanguageClient-neovim', { 'build': 'bash install.sh', 'rev': 'next' })

"call dein#add('easymotion/vim-easymotion')

"lang
call dein#add('rust-lang/rust.vim')

"color schemes
call dein#add('flazz/vim-colorschemes')
call dein#add('flrnd/plastic.vim')

"startify
call dein#add('mhinz/vim-startify')

"NerdTree
call dein#add('scrooloose/nerdtree')                    "alternative for default netrw
call dein#add('jistr/vim-nerdtree-tabs')                "nerdtree and tabs: must have for nerdtree

"airline
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
"call dein#add('Zuckonit/vim-airline-tomato')

call dein#add('scrooloose/nerdcommenter')               "auto-commenting based on filetype               
call dein#add('mbbill/undotree')
call dein#add('majutsushi/tagbar')
"call dein#add('ctrlpvim/ctrlp.vim')


call dein#add('airblade/vim-gitgutter')
"call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
"call dein#add('tpope/vim-obsession')                    "saves current state of Vim: window positions, open folds
