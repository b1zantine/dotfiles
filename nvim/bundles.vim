"call dein#add('Shougo/deoplete.nvim')                   "autocomplete
"call dein#add('deoplete-plugins/deoplete-jedi')
"call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})

"call dein#add('Shougo/neosnippet')
"call dein#add('Shougo/neosnippet-snippets')
"call dein#add('honza/vim-snippets')


call dein#add('kyazdani42/nvim-web-devicons')           " used with telescope
call dein#add('ryanoasis/vim-devicons')                 " used with nerdtree

call dein#add('Shougo/denite.nvim')                     "alternative for unite.vim

"Fuzzy finder
call dein#add('junegunn/fzf', { 'path': '~/.fzf/', 'build': './install --all' })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

"LanguageClient
"call dein#add('autozimu/LanguageClient-neovim', { 'build': 'bash install.sh', 'rev': 'next' })
call dein#add('dense-analysis/ale')


"lang
"call dein#add('vim-syntastic/syntastic')                "syntax checker
"the following languages are supported by syntastic, hence adding these as per
"the syntastic FAQ docs
"call dein#add('rust-lang/rust.vim')
"call dein#add('Quramy/tsuquyomi')       "typescript support

"color schemes
call dein#add('flazz/vim-colorschemes')

"startify
call dein#add('mhinz/vim-startify')

"NerdTree
call dein#add('scrooloose/nerdtree')                    "alternative for default netrw
call dein#add('jistr/vim-nerdtree-tabs')                "nerdtree and tabs: must have for nerdtree

" a small plugin to read git branch info
" This is used to display the git branch manually in airline
" We are doing this as we are not using git extensions
" required by airline
call dein#add('itchyny/vim-gitbranch')

"airline
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

call dein#add('scrooloose/nerdcommenter')               "auto-commenting based on filetype
call dein#add('mbbill/undotree')
call dein#add('majutsushi/tagbar')

call dein#add('tpope/vim-surround')
"call dein#add('tpope/vim-obsession')                    "saves current state of Vim: window positions, open folds


call dein#add('voldikss/vim-floaterm')                  " Terminal inside vim

"telescope
call dein#add('nvim-lua/plenary.nvim')                  "dependency for telescope and vgit
call dein#add('nvim-telescope/telescope.nvim')

call dein#add('tanvirtin/vgit.nvim')

call dein#add('github/copilot.vim')
"Plugins to explore
"https://github.com/kevinhwang91/rnvimr
"https://github.com/voldikss/vim-floaterm
"https://github.com/iamcco/markdown-preview.nvim
