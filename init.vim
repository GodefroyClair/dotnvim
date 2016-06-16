" .vimrc
" " Author: Godefroy Clair
" " Source: 
" "
"
source ~/.config/nvim/plugInit.vim

syntax on


" BASIC OPTIONS {{{1
"
set nohlsearch
set encoding=utf-8
set modelines=0
set autoindent "?? pb avec <ctrl v> ??
set showmode
set showcmd
" set hidden
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start "treat backspace pb at start of line & in indent
set number
set norelativenumber
" set laststatus=2
set history=1000
" set undofile ??
set undoreload=10000
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set shell=/bin/bash\ --login
set lazyredraw
" set matchtime=3
set showbreak=↪
" set splitbelow
" set splitright
" set fillchars=diff:⣿,vert:│
" set autowrite
" set autoread
" set shiftround
set title
" set linebreak
set dictionary=/usr/share/dict/words
" set spellfile=~/.vim/custom-dictionary.utf-8.add
set colorcolumn=+1

set expandtab "don't use actual tab character
set softtabstop=4 "indenting is 4 spaces
let &shiftwidth = &softtabstop "shift is the same as softtabstop
let &tabstop  =  &softtabstop

set matchpairs+=<:>,":" "add pair symbols to the % tool (which find the matching pair)


"PLUGINS TUNING {{{1
"SYNTASTIC {{{2

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

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

"YOUCOMPLETEME {{{2
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
"disable the use of tabs and shift tabs forjYCM - use <C-N> & <C-P> instead
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

"UTLISNIPS {{{2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Trigger configuration. Do not use <tab> if you use YouCompleteMe.

"NERD TREE {{{2
"let g:nerdtree_tabs_open_on_console_startup=1

"Others {{{2
"autocmd filetype php let g:php_folding=2
let g:DisableAutoPHPFolding = 1
"vim-javascript
let g:javascript_enable_domhtmlcss = 1

" FOLDING {{{1

 set foldlevelstart=0
 set foldmethod=marker


"
" FRAMEWORKS {{{1
"
if has("autocmd")
    autocmd Bufnewfile *.html,*.htm 0r ~/.vim/templates/html5Base.html
    autocmd Bufnewfile *.php 0r ~/.vim/templates/phpBase.php
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
    autocmd filetype javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd filetype r set shiftwidth=4 "indenting is 4 spaces
    au filetype html,xml,php,javascript iabbrev </ </<c-x><c-o>
    "autocmd BufRead,BufNewFile *.html,*.js,*.xmlimap </ </<c-x><c-o><Esc>
    "open nerdtree & put cursor into file to edit
    autocmd vimenter * NERDTree | wincmd p

    "php related
    autocmd filetype php set foldmethod=marker
    autocmd filetype vim set foldmethod=marker
endif "end autocmd condition

"
" MAP {{{1
"Command mode shortcut
cmap Sw w ! sudo tee %  > /dev/null
"
"" Nuke Arrow Keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"

"
" INVISIBLE CHARACTER COLORS {{{1
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59



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
