set nocompatible
filetype off

" Vundle =====================================================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'bling/vim-airline'
Plugin 'mhinz/vim-signify'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-eunuch'
Plugin 'scrooloose/syntastic'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'Julian/vim-textobj-variable-segment'
Plugin 'sjl/gundo.vim'

" Local plugins
if filereadable(expand("~/.vimrc.plugins.local"))
    source ~/.vimrc.plugins.local
endif

call vundle#end()

" General Config =============================================================

set autoread
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set hidden
set history=1000
set laststatus=2
set lazyredraw
set modelines=0
set number
set numberwidth=5
set showcmd
set showmatch
set showmode
set splitbelow
set splitright
set title
set ttyfast
set visualbell
set clipboard=unnamed
set colorcolumn=80

syntax on

" Leader
let mapleader = ","
let maplocalleader = "\\"

" Search Settings ============================================================

set incsearch
set hlsearch
set ignorecase
set smartcase

" Persistent undo and backups ================================================

if has("persistent_undo")
    set undodir=~/.vim/tmp/undo
    set undoreload=10000
    set undofile
endif

set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swap
set backup

" Indentation ================================================================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set shiftround

filetype plugin on
filetype indent on

set list listchars=tab:»·,trail:·
set showbreak=↪

" Completion =================================================================

set wildmode=list:longest
set wildmenu

" Scrolling ==================================================================

set scrolloff=3
set sidescrolloff=15
set sidescroll=1

" Convenience mappings =======================================================

" Make Y behave
nnoremap Y y$

" It's 2015.
noremap j gj
noremap k gk

" Easy paragraph formatting
nnoremap Q gqip

" Easy tab navigation
map <S-H> gT
map <S-L> gt

" Substitute
nnoremap <leader>s :%s//<left>

" Clear search highlighting
map <C-l> :nohlsearch<CR>

" Fuck you, help key
noremap  <F1> <NOP>
inoremap <F1> <NOP>

" Close QuickFix window
map <silent> <leader>q :cclose<CR>

" Paste toggle
map <silent> <leader>p :set paste!<CR>

" Wrapping
map <silent> <leader>w :set wrap!<CR>

" Recover from accidental Ctrl-U/Ctrl-W
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Autocommands ===============================================================

if has("autocmd")

  set omnifunc=syntaxcomplete#Complete

  augroup vimrcEx
  au!

  " Remove any trailing whitespace that is in the file
  autocmd BufWrite * if ! &bin | :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")')) | endif

  " Filetype-specific settings
  autocmd Filetype ruby set tabstop=2 shiftwidth=2 softtabstop=2
  autocmd BufRead *.html,*.htm set tabstop=2 shiftwidth=2 softtabstop=2 nowrap
  autocmd BufRead *.txt set tabstop=2 shiftwidth=2 softtabstop=2

  augroup END

endif " has("autocmd")

" Plugin settings ============================================================

" Matchit.vim

runtime macros/matchit.vim

" NERD Tree

map <C-e> :NERDTreeToggle<CR>

let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 40

" Supertab

let g:SuperTabLongestHighlight = 1

" Ack

map <leader>a :Ack!<space>

" CtrlP

let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['tag']

" Signify

let g:signify_vcs_list = ['git']

" Airline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep='❯'
let g:airline_right_alt_sep='❮'
let g:airline_symbols.branch = '⚡'

" Local vimrc ================================================================

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
