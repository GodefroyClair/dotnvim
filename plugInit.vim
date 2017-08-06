
" Vim Plug setup
call plug#begin('~/.config/nvim/plugged')


""""""""""""""""""""""""""""""""""""""
"""""""""""" PLUGINS : """""""""""""""
""""""""""""""""""""""""""""""""""""""

" General enhancements
"
" Plug 'johngrib/vim-game-code-break'
"" git wrapper 
Plug 'tpope/vim-fugitive'
" put commentary with the gc operator
Plug 'tpope/vim-commentary'
" cs/S shortcut : it provides mappings to delete, change and add surroundings in pairs.
Plug 'tpope/vim-surround'
" Complementary pairs of mappings. Mostly fall into four categories.
Plug 'tpope/vim-unimpaired'
" add info to character revealing with ga 
Plug 'tpope/vim-characterize'
" sugar for the UNIX shell commands
Plug 'tpope/vim-eunuch'
" A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, etc. 
" base : <ctrl-X> <ctrl-V>
Plug 'tpope/vim-ragtag'
" Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-repeat'
" CamelCase and underscore_notation
Plug 'bkad/CamelCaseMotion'

" Terminal
Plug 'mklabs/split-term.vim'

" unite : replacer by denit
" Plug 'Shougo/unite.vim'
Plug 'Shougo/denite.nvim'

" status bar 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'albfan/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
" work with nerdtree
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'scrooloose/syntastic'
" Plug 'Shougo/neocomplete'
Plug 'neomake/neomake'
" {{{
    " neomake is async => it doesn't block the editor
    " It's a syntastic alternative. Syntastic was slow for me on python files.
    " $ sudo pip2/pip3 install flake8 -U
    " $ sudo pip2/pip3 install vulture -U
    let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'vulture']
    " let g:neomake_python_enabled_makers = ['flake8', 'pep8']
    " E501 is line length of 80 characters
    let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501'], }
    let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=100', '--ignore=E115,E266'], }
 
    " run neomake on the current file on every write:
    autocmd! BufWritePost * Neomake
    " }}}

"" Ctags
" Plug 'taglist.vim'
Plug 'ludovicchabant/vim-gutentags'

" Git
Plug 'airblade/vim-gitgutter'

" COMPLETION & SNIPPETS
" Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab

" keyword completion
" Plug 'Valloric/YouCompleteMe'
" Async keyword completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" snippets : Track the engine.
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Snippets are separated from the engine. Add this if you want them:
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'matthewsimo/angular-vim-snippets'
Plug 'justinj/vim-react-snippets'
Plug 'bentayloruk/vim-react-es6-snippets'

" Text object {{{2
"
" create your own text object
Plug 'kana/vim-textobj-user'
" use ae & ie to select the whole text
Plug 'kana/vim-textobj-entire'
" use al & il to select the whole line
Plug 'kana/vim-textobj-line'
" use ai or ii to select the whole indented block
Plug 'kana/vim-textobj-indent'
" use ay or iy to select syntax highlighted (e.g in vimrc ~)
Plug 'kana/vim-textobj-syntax'
" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'


""""""" LANGUAGES """"""""""


" Python
Plug 'zchee/deoplete-jedi'
Plug 'hkupty/iron.nvim'
" to test :
" Plug 'hynek/vim-python-pep8-indent', {'for': ['python', 'python3']}
" Plug 'bps/vim-textobj-python', {'for': ['python', 'python3']}

" Javascript js
" Plug 'vimlab/neojs'
Plug 'neovim/node-host'
Plug 'mklabs/mdn.vim'
Plug  'pangloss/vim-javascript'
Plug 'mklabs/jscs.vim', { 'do': 'npm i jscs -g' }
Plug 'burnettk/vim-angular'
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'othree/javascript-libraries-syntax.vim'
" NOTE: yajs.vim is not good on performance with vim
Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax

" Jsx
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support

" Typescript
Plug 'mhartington/deoplete-typescript'
" extended typescript support - works as a client for TSServer
Plug 'Quramy/tsuquyomi', { 'for': 'typescript', 'do': 'npm install' } 
" typescript tools
Plug 'clausreinke/typescript-tools.vim', { 'for': 'typescript' } 
" typescript support
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } 


" PHP :
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'm2mdas/phpcomplete-extended'
Plug 'vim-scripts/phpfolding.vim'

" R
Plug 'jalvesaq/Nvim-R'

" C
Plug 'critiqjo/lldb.nvim', {'for': ['c', 'cpp']}

" C++
Plug 'Rip-Rip/clang_complete', {'for': ['c', 'cpp']}

" HTML
"html5 + inline svg omnicomplete function, indent and syntax for vim. based on the default htmlcomplete.vim.
Plug 'othree/html5.vim'
Plug 'htacg/tidy-html5'



"" File format
" Json
Plug 'elzr/vim-json', {'for': 'json'}
" CSV
Plug 'chrisbra/csv.vim', {'for': 'csv'}
"Markdown
Plug 'plasticboy/vim-markdown'


" all of your plugins must be added before 
call plug#end()            " required
