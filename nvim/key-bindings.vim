let mapleader=" "
"key mappings to normal vim actions
nnoremap / /\v
vnoremap / /\v
nnoremap ; :

"https://stackoverflow.com/a/20418591
au FocusGained,BufEnter * :silent! !          "load changes made out of vim
au FocusLost,WinLeave * :silent! noautocmd w  "autosave

nnoremap <leader>qt :tabonly<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>q :q<CR>
nnoremap Q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>ev :tabe ~/dotfiles/nvim/init.vim<CR>
nnoremap <leader>ef :tabe ~/dotfiles/fish/config.fish<CR>
nnoremap <leader>so :so ~/dotfiles/nvim/init.vim<CR>
nnoremap <leader>p :set paste! <CR>
nnoremap <leader>sr :%s/
" jump to last edited line
nnoremap <leader>g gg=G<bar>gi<Esc>
"noremap <leader>s :update<CR>
inoremap jk <Esc>
vnoremap jk <Esc>
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

nnoremap <tab> %
vnoremap <tab> %
"indents the current line using tabs
vnoremap <Tab> >
vnoremap <S-Tab> <
" move between tabs
nnoremap > :tabnext<CR>
nnoremap < :tabprevious<CR>
nnoremap <Leader>te :tabe
" move between buffers in a tab. Press Alt+Shift+{<, >} keys
nnoremap <M->> :bnext<CR>
nnoremap <M-<> :bprevious<CR>
" jump to a specific tab using "Number+," key combo
for i in range(1, 9)
    exec 'nnoremap ' .. i .. ', ' .. i .. 'gt'
endfor

" navigate between different panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Copy to 'clipboard registry'
vmap <C-c> "+y
nmap <C-a> ggVG
vmap <C-x> dd

inoremap <C-o> <ESC>o

" Moving current line and selected lines
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" UndoTree
nnoremap <Leader>ut :UndotreeToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>

" Tagbar
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>tf :call TagbarFocus()<CR>

"map arrowkey to change viewports size
nnoremap <Right> :vertical resize -5<CR>
nnoremap <Left> :vertical resize +5<CR>
nnoremap <Down> :resize -5<CR>
nnoremap <Up> :resize +5<CR>

" Exiting terminal mode (terminals inside vim)
tnoremap <Esc> <C-\><C-n>

" floaterm
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

"key mappings for plugins
nnoremap <leader>n :NERDTreeTabsToggle<CR>
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>

"telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"neosnippet
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"inoremap <expr><TAB>
            "\ pumvisible() ? "\<C-n>" :
            "\ neosnippet#expandable_or_jumpable() ?
            "\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            "\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

""" ale key bindings
nmap <silent> ep <Plug>(ale_previous_wrap)
nmap <silent> en <Plug>(ale_next_wrap)
nmap <silent> K <Plug>(ale_hover)
nmap <silent> gd <Plug>(ale_go_to_definition_in_tab)
nmap <silent> fr <Plug>(ale_find_references)

""" LanguageClient bindings
"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"nnoremap <silent> <leader>c :call LanguageClient#textDocument_codeAction()<CR>
"nnoremap <silent> <leader>e :call LanguageClient#explainErrorAtPoint()<CR>
"nnoremap <silent> pc :pclose<CR>  "close all preview windows. useful when using LC

" denite
call denite#custom#option('default', {
            \ 'prompt': '❯'
            \ })

call denite#custom#var('file/rec', 'command',
            \ ['rg', '--files', '--vimgrep', '--hidden', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
            \ ['--vimgrep', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#option('_', 'max_dynamic_update_candidates', 100000)
call denite#custom#option('_', {
            \ 'split': 'floating',
            \ 'floating-zindex': 1,
            \ 'floating-border': '-',
            \ 'floating-preview': v:true,
            \ 'highlight_matched_char': 'Underlined',
            \ 'highlight_matched_range': 'NormalFloat',
            \ 'wincol': &columns / 6,
            \ 'winwidth': &columns * 2 / 3,
            \ 'winrow': &lines / 6,
            \ 'winheight': &lines * 2 / 3
            \ })

autocmd FileType denite call s:denite_settings()

function! s:denite_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <C-v>
                \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <C-s>
                \ denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> <Esc>
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
endfunction

autocmd FileType denite-filter call s:denite_filter_settings()

function! s:denite_filter_settings() abort
    nmap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
endfunction

"nnoremap <C-t> :tabe<cr>:CtrlP<cr>
" open new tab with denite window opened
nnoremap <C-t> :tabe<CR>:<C-u>Denite file/rec -start-filter<CR>
nnoremap <C-p> :<C-u>Denite file/rec -start-filter<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:.<CR>
nnoremap <leader>/ :<C-u>Denite -start-filter grep:::!<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir -start-filter grep:::!<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file/rec -start-filter<CR>
nnoremap <leader>r :<C-u>Denite -resume -cursor-pos=+1<CR>
nnoremap <leader><C-r> :<C-u>Denite register:.<CR>

" vgit.nvim settings
lua << EOF
-- below config avoids vim flickering while editing
vim.o.updatetime = 300
vim.wo.signcolumn = 'yes'
-- vim.o.incsearch = false

require('vgit').setup({
keymaps = {
    ['n <leader>nh'] = 'hunk_up',
    ['n <leader>ph'] = 'hunk_down',
    ['n <leader>gs'] = 'buffer_hunk_stage',
    ['n <leader>gr'] = 'buffer_hunk_reset',
    ['n <leader>gp'] = 'buffer_hunk_preview',
    ['n <leader>gb'] = 'buffer_blame_preview',
    ['n <leader>gf'] = 'buffer_diff_preview',
    ['n <leader>gh'] = 'buffer_history_preview',
    ['n <leader>gg'] = 'buffer_gutter_blame_preview',
    ['n <leader>gl'] = 'project_hunks_preview',
    ['n <leader>gd'] = 'project_diff_preview',
    ['n <leader>gq'] = 'project_hunks_qf',
    }
})
EOF
