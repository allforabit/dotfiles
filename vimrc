" ================ Vundle ====================
set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

Plugin 'joonty/vdebug.git'
Plugin 'countoren/WSearch'

" My Plugins here:
"
" original repos on github
" Plugin 'neovim/node-host'
" Plugin 'snoe/nvim-parinfer.js'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace.git'
Plugin 'tpope/vim-classpath.git'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-sexp-mappings-for-regular-people.git'
Plugin 'veloce/vim-behat'
Plugin 'luochen1990/rainbow'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-repeat'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
Plugin 'tomasr/molokai'
Plugin 'sbl/scvim.git'

Plugin 'marijnh/tern_for_vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'tobys/vip.git'
Plugin 'wavded/vim-stylus'
Plugin 'plasticboy/vim-markdown.git'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'mklabs/grunt.vim'
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'eiginn/netrw'
Plugin 'scrooloose/nerdtree'
Plugin 'heavenshell/vim-jsdoc'

Plugin 'sophacles/vim-processing'

Plugin 'kchmck/vim-coffee-script'

Plugin 'vim-scripts/bufmru.vim'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"vim-react-snippets:
Plugin 'justinj/vim-react-snippets'
"Plugin 'ervandew/supertab'

Plugin 'mattn/emmet-vim'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
" Plugin 'paredit.vim'

" non github repos
Plugin 'git://git.wincent.com/command-t.git'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bling/vim-airline'

Plugin 'altercation/vim-colors-solarized'

Plugin 'pangloss/vim-javascript'

call vundle#end()

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set autowrite

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

set nocursorline
set nocursorcolumn
set scrolljump=5

set clipboard=unnamed

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ================ Misc ========================

set pastetoggle=<F2>

" set statusline=[%n]\ %<%.99f\ %h%w%m%r%{SL('CapsLockStatusline')}%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P
" set statusline+=%#warningmsg#
" set statusline+=%*

set timeoutlen=1200 " A little bit more time for macros
set ttimeoutlen=50  " Make Esc work faster

let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
colorscheme molokai

" ...

filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..


"The default leader is '\', but many people prefer ',' as it's in a standard
"location
let mapleader = ','
let maplocalleader = ','


"Map colon to semicolon and double semicolon to semicolon
map ; :
noremap ;; ;

"nerdtree config
nmap <silent> <Leader>l :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

nmap <silent> <Leader>m :make<CR>

nmap <silent> <Leader>r :w<CR>


let g:proj_flags="lmstc"

if has('gui_running')
set guioptions-=T           " remove the toolbar
set lines=40                " 40 lines of text instead of 24,
set guifont=Andale\ Mono\ Regular:h14,Menlo\ Regular:h14,Consolas\ Regular:h14,Courier\ New\ Regular:h14
if has('gui_macvim')
set transparency=0          " Make the window slightly transparent
endif
else
"set term=builtin_ansi       " Make arrow and other keys work
endif

inoremap <C-P> :call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Always show file info
set modeline
set ls=2

" Sudo write
cmap w!! w !sudo tee >/dev/null %

" Text files
au BufRead,BufNewFile *.txt,*.tex,*.md set wrap linebreak nolist textwidth=0 wrapmargin=0

let g:session_autosave='yes'
let g:session_autoload='yes'

let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ > ])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
\}

if has("eval")
function! SL(function)
  if exists('*'.a:function)
    return call(a:function,[])
  else
    return ''
  endif
endfunction
endif

command! Piggie :Piggieback (cemerick.austin/exec-env)
command! Biggie :Piggieback (cemerick.austin/exec-env :exec-cmds ["open" "-ga" "/Applications/Google Chrome.app"])
command! Wiggie :Piggieback (weasel.repl.websocket/repl-env :ip "0.0.0.0" :port 9001) 

"set clipboard=unnamed

"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"
autocmd FileType cucumber let b:dispatch = 'cd ~/Projects/campusie/sites/default/behat-tests;behat'
autocmd FileType php let b:dispatch = 'cd ~/Projects/campusie/sites/default/behat-tests;behat'
autocmd FileType drupal let b:dispatch = 'drush cc all -q'

map <F8>    :make<CR>
map <F9>    :Dispatch<CR>
let g:feature_filetype='behat'

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-u>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Disable scratch pad showing for tern plugin autocomplete
set completeopt-=preview
" When the filetype is FILETYPE then make AutoPairs only match for parenthesis
" autocmd Filetype clojure let b:AutoPairs = {}
let g:AutoPairsFlyMode = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Toggle this for vim-sexp to not go into insert mode after wrapping something
let g:sexp_insert_after_wrap = 0
" Toggle this to disable automatically creating closing brackets and quotes
let g:sexp_enable_insert_mode_mappings = 1

let g:sexp_mappings = {
  \ 'sexp_insert_at_list_tail':      '',
  \ }

command! Figwheel :Piggieback! (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))
