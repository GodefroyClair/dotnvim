" nvim/init.vim
" " Author: Godefroy Clair
" " Source:
" "
"""" DEBUG ""
" let w:airline_disabled=1

"""""""""""""""""""""""""""""""
"""""""INTERNAL-VARIABLE"""""""
"""""""""""""""""""""""""""""""
"                (nothing)  In a function: local to a function; otherwise: global
" buffer-variable    b:     Local to the current buffer.
" window-variable    w:     Local to the current window.
" tabpage-variable   t:     Local to the current tab page.
" global-variable    g:     Global.
" local-variable     l:     Local to a function.
" script-variable    s:     Local to a :source'ed Vim script.
" function-argument  a:     Function argument (only inside a function).
" vim-variable       v:     Global, predefined by Vim.
" "
" "
source ~/.config/nvim/plugInit.vim

syntax on
nnoremap <CR> :nohlsearch<CR><CR>


"set window style
hi Normal ctermfg=lightgrey ctermbg=darkblue "hi = highlight
hi MatchParen ctermbg=yellow "color of matching pairs

"map the leader key
let mapleader=","

set nu
let g:airline_theme='luna'

set updatetime=250

"PLUGINS TUNING {{{1

"DEOPLETE
"
"" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#tss#javascript_support = 1
let g:deoplete#sources#jedi#statement_length=30
let g:deoplete#sources#jedi#enable_cachem=1
" let g:deoplete#sources#jedi#show_docstring=0
" let g:deoplete#sources#jedi#python_path
" let g:deoplete#sources#jedi#debug_server


" vim-plug
set runtimepath+=~/.config/nvim/plugged/deoplete.nvim
" set completeopt+=noinsert,noselect
" set completeopt-=preview



" deoplete-tern
let g:tern_request_timeout = 1
" let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]

hi Pmenu    gui=NONE    guifg=#c5c8c6 guibg=#373b41
hi PmenuSel gui=reverse guifg=#c5c8c6 guibg=#373b41

filetype plugin indent on

"NERDTreeTabs : run on console vim startup
let g:nerdtree_tabs_open_on_console_startup=1

"SYNTASTIC {{{2

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" use eslint
" let g:syntastic_javascript_checkers = ['eslint']
" use jshint
" let g:syntastic_javascript_checkers = ['jshint']

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_quiet_messages = { "type": "style" }
" let g:syntastic_php_phpcs_quiet_messages = {
"     \ 'regex': [
"     \ 'Short PHP opening tag used with echo',
"     \ 'Missing file doc comment',
"     \ 'Opening brace should be on a new line',
"     \ 'File is being conditionally included',
"     \ 'Opening brace of a class must be on the line'
"     \ ] }

"NEOSNIPPETS {{{2

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.config/nvim/CustomSnips'
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/neosnippet-snippets/neosnippet, ~/.config/nvim/plugged/angular-vim-snippets/snippets, ~/.config/nvim/CustomSnips'


"Edit snippet file in vertical split
command! NeoSnipEditV NeoSnippetEdit -split -vertical

"YOUCOMPLETEME {{{2

" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_use_ultisnips_completer = 1
"disable the use of tabs and shift tabs forjYCM - use <C-N> & <C-P> instead
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
" let g:ycm_confirm_extra_conf=0

"UTLISNIPS {{{2
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" files to store snippets, where UltiSnipEdit is seeking when writing a new file
" let g:UltiSnipsEditSplit='horizontal'
"let g:UltiSnipsSnippetsDir="~/.config/nvim/plugged/vim-snippets/UltiSnips"
" let g:UltiSnipsSnippetsDir="~/.config/nvim/CustomSnips"
"file where the snippets are looked for
" let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/plugged/vim-snippets/UltiSnips', '~/.config/nvim/CustomSnips' ]

"NERD TREE {{{
"let g:nerdtree_tabs_open_on_console_startup=1

"NEOMAKE {{{

" let g:neomake_javascript_jshint_maker = {
"     \ 'args': ['--verbose'],
"     \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"     \ }
" let g:neomake_javascript_enabled_makers = ['jshint']
let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_verbose=0
" let g:neomake_open_list = 0

autocmd! BufWritePost * Neomake


"LLDB {{{2

nmap <M-b> <Plug>LLBreakSwitch
vmap <F2> <Plug>LLStdInSelected
nnoremap <F4> :LLstdin<CR>
nnoremap <F5> :LLmode debug<CR>
nnoremap <S-F5> :LLmode code<CR>
nnoremap <F8> :LL continue<CR>
nnoremap <S-F8> :LL process interrupt<CR>
nnoremap <F9> :LL print <C-R>=expand('<cword>')<CR>
vnoremap <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

"PHP {{{2
"autocmd filetype php let g:php_folding=2
let g:DisableAutoPHPFolding = 1

"javascript {{{2
let g:javascript_enable_domhtmlcss = 1
"jsx
let g:jsx_ext_required = 0 

" Markdown {{{2
let g:vim_markdown_folding_disabled = 1
" FOLDING {{{1

set foldlevelstart=0
set foldmethod=marker


"
" FRAMEWORKS {{{1
"
if has("autocmd")
    autocmd Bufnewfile *.html,*.htm 0r ~/.config/nvim/templates/html5Base.html
    autocmd Bufnewfile *.php 0r ~/.config/nvim/templates/phpBase.php
endif

" FILETYPE {{{1
"
if has("autocmd")
    autocmd Bufnewfile,BufRead *.PHP,*.php set filetype=php
    autocmd BufNewFile,BufRead *.conf,*.rss,*.atom,*.xml setfiletype xml
    autocmd BufNewFile,BufRead *.html,*.ejs set ft=html
    autocmd BufNewFile,BufRead *.json set ft=javascript
    autocmd BufNewFile,BufRead *.r,*.R set ft=r
    autocmd BufNewFile,BufRead *.py set ft=python
    "BufRead is triggered after the buffer has been populated with the content of a file.
    "BufEnter is triggered after you enter a buffer for editing.
    "use BufNew, BufRead or BufAdd for things at creation of buffer

    "auto-completion (au shortcut for autocmd)
    autocmd filetype html set omnifunc=htmlcomplete#CompleteTags
    au filetype html,xml,php,javascript iabbrev </ </<c-x><c-o>
    autocmd filetype javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd filetype r set shiftwidth=4 "indenting is 4 spaces
    autocmd filetype vim set spelllang=en_us
    autocmd filetype md set spelllang=fr_FR
    "autocmd BufRead,BufNewFile *.html,*.js,*.xmlimap </ </<c-x><c-o><Esc>
    "open nerdtree & put cursor into file to edit
    autocmd vimenter * NERDTree | wincmd p

    "php related
    autocmd filetype php set foldmethod=marker
    autocmd filetype vim set foldmethod=marker
endif "end autocmd condition

    "R related
    autocmd filetype R set path+=~/githubRepos/general-functions

    "Markdown related
    " autocmd filetype Markdown
    map gl <Plug>Markdown_EditUrlUnderCursor


"------------------------------------
" Nvim-R
"------------------------------------
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
vmap <leader>, <Plug>RDSendSelection
nmap <leader>; <Plug>RDSendLine

"------------------------------------
" Fin Nvim-R
"------------------------------------

"
" MAP & GLOBAL{{{1
"Command mode shortcut
cmap Sw w ! sudo tee %  > /dev/null
"
"
"edit your init.vim & plugInit.vim quickly
let $MYVIMPLUG=fnamemodify($MYVIMRC, ':p:h'). '/plugInit.vim'
" let $MYVIMPLUG=system('dirname $MYVIMRC') . "plugInit.vim"
" let $MYVIMPLUG .= "/plugInit.vim"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ep :vsplit $MYVIMPLUG<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" create var for vimplug file

" expand($MYVIMRC:h)/plugInit.vim

"" Nuke Arrow Keys
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"

""nvim terminal emulation window commands
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"dictionary
imap <Leader>s <C-o>:setlocal spell! spelllang=en_us<CR>
nmap <Leader>s :setlocal spell! spelllang=en_us<CR>

" CTAGS {{{1
"ctags config

set tags=tags;/
" let tags="./tags,tags"

" INVISIBLE CHARACTER COLORS {{{1
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"Windows settings
command! Termb bot 5split | term

" function! FormatprgLocal(filter)
"     if !empty(v:char)
"         return 1
"     else
"         let l:command = v:lnum.','.(v:lnum+v:count-1).'!'.a:filter
"         echo l:command
"         execute l:command
"     endif
" endfunction

" if has("autocmd")
"     let pandoc_pipeline  = "pandoc --from=html --to=html"
"     autocmd FileType html setlocal formatexpr=FormatprgLocal(pandoc_pipeline)
" endif
"
