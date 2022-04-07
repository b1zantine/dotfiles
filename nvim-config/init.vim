if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  
  source ~/dotfiles/nvim-config/bundles.vim

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"setting goes here
syntax on
syntax enable
set relativenumber
set number
set encoding=utf8

filetype plugin on
filetype indent on 

set nowrap
set noswapfile
set title

"search settings
set incsearch
set ignorecase
set showmatch
set smartcase

" tab settings
set expandtab
set smarttab
set autoindent
set copyindent
set shiftround
set tabstop=2 shiftwidth=2 softtabstop=2
set foldmethod=indent
set smartindent
set foldlevel=99

"system related settings
set mouse=a
set spell
set cursorline
set history=1000
set clipboard=unnamed     
set backspace=indent,eol,start              " Make backspace behave normally.
set autowriteall
set visualbell
set modifiable
" wildmenu settings
set wildmode=list:longest,full
set wildmenu

set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
set t_Co=256

" undo settings
set undodir=~/.cache/undodir
set undofile
set undolevels=1000                         "maximum number of changes that can be undone
set undoreload=10000                        "maximum number lines to save

"split plane, more natural setting
set splitbelow
set splitright

" Color Scheme settings
colorscheme plastic
set background=dark
set termguicolors

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 13

"include key bindings
source ~/dotfiles/nvim-config/key-bindings.vim


"""""""""""""""""""""""""
"""" Plugin settings """"
"""""""""""""""""""""""""
j
"Starify settings
" let g:startify_custom_footer =
"       \ map(split(system('fortune | cowsay -f calvin'), '\n'), '"   ". v:val') + ['']
let g:startify_custom_header= [
      \ ' _      _   _                 _ _   ',
      \ '| |    | | ( )               | | | ',
      \ '| | ___| |_|/ ___   _ __ ___ | | | ',
      \ '| |/ _ \ __| / __| |  __/ _ \| | |  ',
      \ '| |  __/ |_  \__ \ | | | (_) | | | ',
      \ '|_|\___|\__| |___/ |_|  \___/|_|_| ', 
      \ '',
      \ '',
      \ ]
"let g:startify_files_number        = 10
let g:startify_session_persistence = 1
let g:startify_session_autoload    = 1
let g:startify_enable_special      = 0
let g:startify_files_number        = 5
let g:startify_change_to_dir       = 0

let g:startify_bookmarks = [ 
    \ '~/dotfiles',
    \ ]

"Nerdtree settings
" let g:nerdtree_tabs_open_on_console_startup=1
"let g:nerdtree_tabs_smart_startup_focus = 1
"let g:nerdtree_tabs_open_on_new_tab= 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_synchronize_focus = 1
let g:nerdtree_tabs_focus_on_files = 1
"autocmd VimEnter * if !argc() | NERDTree | endif
"autocmd VimEnter * wincmd p       "This keeps the cursor in the main window rather than the NERDTree window

"autocmd VimEnter * NERDTreeMirror
"autocmd VimEnter * NERDTreeMirrorOpen
"autocmd VimEnter * NERDTreeTabsOpen

" airline configuration
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline_solarized_bg='dark'
let g:airline#extensions#branch#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#branch#empty_message = ''
"let g:airline#extensions#syntastic#enabled= 1
let g:airline#extensions#tagbar#enable= 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#unite#enable= 1
" let g:airline#extensions#hunks#enable= 1
" let g:airline#extensions#tmuxline#enabled = 0

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#indicator_checking = "\uf110"
let g:airline#extensions#ale#indicator_infos = "\uf129"
let g:airline#extensions#ale#indicator_warnings = "\uf071"
let g:airline#extensions#ale#indicator_errors = "\uf05e"
let g:airline#extensions#ale#indicator_ok = "\uf00c"

"Syntastic customization
"doesn't support fish, so point it to any other shell like sh, zsh, bash
"let g:syntastic_shell = '/bin/zsh'
"let g:syntastic_python_python_exe = '/usr/bin/python3'
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_style_error_symbol = '✠'
"let g:syntastic_warning_symbol = '∆'
"let g:syntastic_style_warning_symbol = '☢'

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"integrating tsuquyomi with syntastic
"let g:tsuquyomi_disable_quickfix = 1
"let g:syntastic_typescript_checkers = ['tsuquyomi']


"deoplete
"let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/bin/python3' " Required for deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

"neocomplete
" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.cache/dein/repos/github.com/honza/vim-snippets/snippets'


" Rust format on save:
"let g:rustfmt_autosave = 1

" Run gofmt on save
"autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

"LanguageClient configuration
" See https://github.com/autozimu/LanguageClient-neovim
" Language Server and clients for different langs - https://langserver.org/ 
" For TS and JS, install https://github.com/typescript-language-server/typescript-language-server
"let g:LanguageClient_serverCommands = {
    "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    "\ 'python': ['/usr/local/bin/pyls'],
    "\ 'go': ['~/go/bin/gopls'],
    "\ 'typescript': ['fish', '-c', 'node -v && ~/.nvm/versions/node/v16.14.2/bin/typescript-language-server --stdio'],
    "\ 'javascript': ['fish', '-c', 'node -v && ~/.nvm/versions/node/v16.14.2/bin/typescript-language-server --stdio'],
    "\ 'typescript.tsx': ['fish', '-c', 'node -v && ~/.nvm/versions/node/v16.14.2/bin/typescript-language-server --stdio'],
    "\ 'javascript.tsx': ['fish', '-c', 'node -v && ~/.nvm/versions/node/v16.14.2/bin/typescript-language-server --stdio'],
    "\ 'docker': ['fish', '-c', 'node -v && ~/.nvm/versions/node/v16.14.2/bin/docker-langserver --stdio'],
    "\ }

" Don't show inline errors.
"let g:LanguageClient_useVirtualText='CodeLens'

" Used for debugging LanguageClient
 "let $RUST_BACKTRACE = 1
 "let g:LanguageClient_loggingLevel = 'INFO'
 "let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
 "let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
 

" Plugin config to add before loading the plugins itself

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_floating_preview = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_lsp_suggestions = 1

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '∆'

let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'rust': ['rustfmt', 'rls'],
    \ 'python': ['autopep8'],
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
\}


