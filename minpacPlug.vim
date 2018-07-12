packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('sheerun/vim-polyglot')
" GENERAL STUFF {{{1
" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
" Git
call minpac#add('airblade/vim-gitgutter')
" Git wrapper 
call minpac#add('tpope/vim-fugitive')
" put commentary with the gc operator
call minpac#add('tpope/vim-commentary')
" cs : provides mappings to del, chg, add surroundings in pairs.
call minpac#add('tpope/vim-surround')
" Complementary pairs of mappings. Mostly fall into four categories.
call minpac#add('tpope/vim-unimpaired')
" add info to character revealing with ga 
call minpac#add('tpope/vim-characterize')
" sugar for the UNIX shell commands
call minpac#add('tpope/vim-eunuch')
" A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, etc. 
" base : <ctrl-X> <ctrl-V>
call minpac#add('tpope/vim-ragtag')
" Repeat.vim remaps . in a way that plugins can tap into it.
call minpac#add('tpope/vim-repeat')
" hilight yanks
call minpac#add('machakann/vim-highlightedyank')
" CamelCase and underscore_notation
call minpac#add('bkad/CamelCaseMotion')

" General enhancements
"
" call minpac#add('johngrib/vim-game-code-break')
call minpac#add('mklabs/split-term.vim')
call minpac#add('kassio/neoterm')

" Esthetics & theme
call minpac#add('trevordmiller/nova-vim')


"" Ctags
" call minpac#add('taglist.vim')
call minpac#add('ludovicchabant/vim-gutentags')


" TEXT OBJECT {{{1

" Create your own text object
call minpac#add('kana/vim-textobj-user')
" use ae & ie to select the whole text
call minpac#add('kana/vim-textobj-entire')
" use al & il to select the whole line
call minpac#add('kana/vim-textobj-line')
" use ai or ii to select the whole indented block
call minpac#add('kana/vim-textobj-indent')
" use ay or iy to select syntax highlighted (e.g in vimrc ~)
call minpac#add('kana/vim-textobj-syntax')
" automatic closing of quotes, parenthesis, brackets, etc.
" call minpac#add('Raimondi/delimitMate')
call minpac#add('jiangmiao/auto-pairs')
" This plugin provides a text-object 'a' (argument)
call minpac#add('vim-scripts/argtextobj.vim')
" ai – the current indentation level and the line above
" ii – the current indentation level excluding the line above
call minpac#add('michaeljsmith/vim-indent-object')

" plugin for Neovim/Vim to unite all interfaces
" replace unite
call minpac#add('Shougo/denite.nvim')

" Nerdtree {{{1
call minpac#add('scrooloose/nerdtree')
call minpac#add('jistr/vim-nerdtree-tabs')
call minpac#add('scrooloose/nerdtree', {'on': 'NERDTreeToggle'})
call minpac#add('albfan/nerdtree-git-plugin', {'on': 'NERDTreeToggle'})

" STATUS BAR {{{1
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" DEVELOPER TOOLS {{{1
call minpac#add('metakirby5/codi.vim')

" AUTOCOMPLETION {{{1
" Async keyword completion
call minpac#add('Shougo/deoplete.nvim') ", { 'do': ':UpdateRemotePlugins' })
call minpac#add('carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' })
call minpac#add('ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }, {'do': 'npm install'})

" LanguageClient (Language Server Protocol)

call minpac#add('autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ })

" (Optional) Multi-entry selection UI.
call minpac#add('junegunn/fzf')

" jspc
call minpac#add('othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx', 'typescript'] })


" same as deoplete for vim 8
" call minpac#add('Shougo/neocomplete')
" keyword completion
" call minpac#add('Valloric/YouCompleteMe')

" call minpac#add('alvan/vim-closetag')
call minpac#add('ervandew/supertab') " Perform all your vim insert mode completions with Tab

" SNIPPETS {{{1

" snipMate
call minpac#add('MarcWeber/vim-addon-mw-utils')
call minpac#add('tomtom/tlib_vim')
" call minpac#add('garbas/vim-snipmate')
" Optional 
" call minpac#add('honza/vim-snippets')

" ultisnips
call minpac#add('SirVer/ultisnips')
call minpac#add('justinj/vim-react-snippets')
call minpac#add('bentayloruk/vim-react-es6-snippets')

" An Interface to WEB APIs. (dependency for Emmet
" call minpac#add('mattn/webapi-vim')

" Emmet
" call minpac#add('mattn/emmet-vim')


" LINTING {{{1
" call minpac#add('neomake/neomake')
call minpac#add('w0rp/ale')

" LANGUAGES SPECIFIC {{{1

" Python
call minpac#add('zchee/deoplete-jedi')
call minpac#add('hkupty/iron.nvim')
" to test :
call minpac#add('hynek/vim-python-pep8-indent', {'for': ['python', 'python3']})
call minpac#add('bps/vim-textobj-python', {'for': ['python', 'python3']})

" Javascript js
"call minpac#add('vimlab/neojs') " workd with plug
" call minpac#add('neovim/node-host') " in neovim
call minpac#add('moll/vim-node')
call minpac#add('mklabs/mdn.vim') " documentation
" snippets
call minpac#add('isRuslan/vim-es6')

" JavaScript indexindent support
" call minpac#add('pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] })
" vim-jsx is somehow useful to defect jsx filetype in js
call minpac#add('mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] })
" call minpac#add('gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx'] })

" Node support
" Use gf on paths or requires to open the same file Node.js would.
call minpac#add('moll/vim-node', { 'for': 'javascript' })
" call minpac#add('othree/javascript-libraries-syntax.vim')
" NOTE: yajs.vim is not good on performance with vim
" JavaScript syntax plugin
" call minpac#add('othree/yajs.vim', { 'for': 'javascript' })
" ES6 and beyond syntax
" call minpac#add('othree/es.next.syntax.vim', { 'for': 'javascript' })

call minpac#add('Galooshi/vim-import-js') ", { 'do': 'npm install -g import-js' })

" Typescript
call minpac#add('mhartington/deoplete-typescript')
" extended typescript support - works as a client for TSServer
call minpac#add('Quramy/tsuquyomi', { 'for': 'typescript', 'do': 'npm install' })
" typescript tools
call minpac#add('clausreinke/typescript-tools.vim', { 'for': 'typescript' })
" typescript support
call minpac#add('leafgarland/typescript-vim', { 'for': 'typescript' })

" Reason ML
call minpac#add('reasonml-editor/vim-reason-plus')

" PHP :
call minpac#add('Shougo/vimproc', {'do': 'make'})
call minpac#add('m2mdas/phpcomplete-extended')
call minpac#add('vim-scripts/phpfolding.vim')

" R
call minpac#add('jalvesaq/Nvim-R')

" C
" call minpac#add('dbgx/lldb.nvim')
" call minpac#add('critiqjo/lldb.nvim')

" C++
call minpac#add('Rip-Rip/clang_complete', {'for': ['c', 'cpp']})

" HTML
"html5 + inline svg omnicomplete function, indent and syntax for vim. based on the default htmlcomplete.vim.
" CSS
call minpac#add('wavded/vim-stylus')

" CSS3/HTML5 bundled in and adapted from css3.vim by Hsiaoming Young
call minpac#add('othree/html5.vim')
call minpac#add('htacg/tidy-html5')



"" File format
" Json
call minpac#add('elzr/vim-json', {'for': 'json'})
" CSV
call minpac#add('chrisbra/csv.vim', {'for': 'csv'})
"Markdown
call minpac#add('plasticboy/vim-markdown')
call minpac#add('JamshedVesuna/vim-markdown-preview')



" DOC {{{1
" Blueprint
call minpac#add('kylef/apiblueprint.vim')



" FOOTER {{{1
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
