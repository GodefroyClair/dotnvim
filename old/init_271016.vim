" .vim.vimrc
" " Author: Godefroy Clair
" " Source: 
" "
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

"set window style
hi Normal ctermfg=lightgrey ctermbg=darkblue "hi = highlight
hi MatchParen ctermbg=yellow "color of matching pairs

"map the leader key
let mapleader="\<SPACE>"


" BASIC OPTIONS {{{1
"
"
set nohlsearch
:if !has('nvim')
:set encoding=utf-8
:endif
set modelines=0
set autoindent "?? pb avec <ctrl v> ??
set showmode
set showcmd
" set hidden
set visualbell
"set ttyfast // not used with neovim ?
set ruler
set backspace=indent,eol,start "treat bckspc pb at strt of ln & in indent
set number
set norelativenumber
" set laststatus=2
set history=1000
" set undofile ??
set undoreload=10000
set list
"show invisible char
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
" set shell=/bin/bash\ --login //break terminal command in neovim
set lazyredraw
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

"the matchit plugin of nvim uses better command to improve over the vim
"matchit
"the matchpairs still works but is improved with the match_words variable
"set matchpairs+=<:>,":" "add pair symbols to the % tool (which find the matching pair)
let b:match_words = '<:>,<.{-}>:</.\{-}>,if:endif'
let b:match_ignorecase = 0
set showmatch
set matchtime=3



"PLUGINS TUNING {{{1

"DEOPLETE
"
"" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

"SYNTASTIC {{{2

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
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
let g:ycm_confirm_extra_conf=0

"UTLISNIPS {{{2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"
" files to store snippets, where UltiSnipEdit is seeking when writing a new file
let g:UltiSnipsSnippetsDir="~/.config/nvim/CustomSnips" 
let g:UltiSnipsSnippetsDir="~/.config/nvim/plugged/vim-snippets/UltiSnips" 
"file where the snippets are looked for 
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/plugged/vim-snippets/UltiSnips','UltiSnips',"~/.config/nvim/CustomSnips" ]


"NERD TREE {{{2
"let g:nerdtree_tabs_open_on_console_startup=1

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

    "R related
    autocmd filetype R set path+=~/githubRepos/general-functions


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
"" MAP {{{1
""Command mode shortcut
"cmap Sw w ! sudo tee %  > /dev/null
""
""
""edit your init.vim & plugInit.vim quickly
"let $MYVIMPLUG=fnamemodify($MYVIMRC, ':p:h'). '/plugInit.vim'
"" let $MYVIMPLUG=system('dirname $MYVIMRC') . "plugInit.vim"
"" let $MYVIMPLUG .= "/plugInit.vim"
"nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"nnoremap <leader>ep :vsplit $MYVIMPLUG<cr>
"nnoremap <leader>sv :source $MYVIMRC<cr>
"" create var for vimplug file

"" expand($MYVIMRC:h)/plugInit.vim

""" Nuke Arrow Keys
""nnoremap <up> <nop>
""nnoremap <down> <nop>
""nnoremap <left> <nop>
"nnoremap <right> <nop>
"

"""nvim terminal emulation window commands
"tnoremap <Esc> <C-\><C-n>
"tnoremap <A-h> <C-\><C-n><C-w>h
"tnoremap <A-j> <C-\><C-n><C-w>j
"tnoremap <A-k> <C-\><C-n><C-w>k
"tnoremap <A-l> <C-\><C-n><C-w>l
"nnoremap <A-h> <C-w>h
"nnoremap <A-j> <C-w>j
"nnoremap <A-k> <C-w>k
"nnoremap <A-l> <C-w>l

"" CTAGS {{{1
""ctags config

"set tags=tags;/
"" let tags="./tags,tags"

"" INVISIBLE CHARACTER COLORS {{{1
""highlight NonText guifg=#4a4a59
""highlight SpecialKey guifg=#4a4a59



"" function! FormatprgLocal(filter)
""     if !empty(v:char)
""         return 1
""     else
""         let l:command = v:lnum.','.(v:lnum+v:count-1).'!'.a:filter
""         echo l:command
""         execute l:command
""     endif
"" endfunction

"" if has("autocmd")
""     let pandoc_pipeline  = "pandoc --from=html --to=html"
""     autocmd FileType html setlocal formatexpr=FormatprgLocal(pandoc_pipeline)
"" endif
""
