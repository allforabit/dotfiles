" ================ Vundle ====================
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fireplace.git'
Bundle 'tpope/vim-classpath.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'kien/rainbow_parentheses.vim.git'
Bundle 'guns/vim-clojure-static'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'tomasr/molokai'
Bundle 'sbl/scvim.git'
Bundle 'ervandew/supertab.git'
Bundle 'tobys/vip.git'
Bundle 'wavded/vim-stylus'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'mklabs/grunt.vim'
Bundle 'scrooloose/syntastic'
Bundle 'othree/html5.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'eiginn/netrw'
Bundle 'scrooloose/nerdtree'

Bundle 'sophacles/vim-processing'

Bundle 'kchmck/vim-coffee-script'

Bundle 'vim-scripts/bufmru.vim'
Bundle 'tpope/vim-surround'
Bundle 'jiangmiao/auto-pairs'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

Bundle "garbas/vim-snipmate"

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'paredit.vim'

" Bundle 'project.tar.gz'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'


Bundle 'git://drupalcode.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

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

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set timeoutlen = 5000  " allow buffer switching without saving

colorscheme molokai 

" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


"The default leader is '\', but many people prefer ',' as it's in a standard
"location
let mapleader = ','
let maplocalleader = ','


"Map colon to semicolon and double semicolon to semicolon
map ; :
noremap ;; ;

"nmap <silent> <Leader>l :Project<CR>

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

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
