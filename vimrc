set nocompatible

" Vundle =====================================================================

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'

" General Config =============================================================

set autoread
set backspace=indent,eol,start
set cursorline
set history=1000
set number
set showcmd
set showmode
set visualbell

" Leader
let mapleader = ","
let maplocalleader = "\\"

" Search Settings ============================================================

set incsearch
set hlsearch
set ignorecase
set smartcase

" Persistent undo and backups ================================================

silent !mkdir -p ~/.vim/tmp/undo > /dev/null 2>&1
silent !mkdir -p ~/.vim/tmp/backup > /dev/null 2>&1
silent !mkdir -p ~/.vim/tmp/swap > /dev/null 2>&1

set undodir=~/.vim/tmp/undo
set undoreload=10000
set undofile
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

filetype plugin on
filetype indent on

set list listchars=tab:»·,trail:·

" Completion =================================================================

set wildmode=list:longest
set wildmenu

" Colors =====================================================================

syntax on
set background=dark
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    colorscheme solarized
endif

" Scrolling ==================================================================

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Convenience mappings =======================================================

" Make capitals behave
nnoremap D d$
nnoremap Y y$

" It's 2012.
noremap j gj
noremap k gk

" Easy buffer navigation
noremap <C-h>     <C-w>h
noremap <C-j>     <C-w>j
noremap <C-k>     <C-w>k
noremap <C-l>     <C-w>l
noremap <leader>v <C-w>v

" Substitute
nnoremap <leader>s :%s//<left>

" Toggle search highlighting
map <Leader>h :nohlsearch<CR>

" Fuck you, help key
noremap  <F1> <NOP>
inoremap <F1> <NOP>

" Disable those arrow keys!
inoremap  <Up>     <NOP>
noremap   <Up>     <NOP>
inoremap  <Down>   <NOP>
noremap   <Down>   <NOP>
inoremap  <Left>   <NOP>
noremap   <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Right>  <NOP>

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Autocommands ===============================================================

if has("autocmd")

  set omnifunc=syntaxcomplete#Complete

  augroup vimrcEx
  au!

  " Remove any trailing whitespace that is in the file
  autocmd BufWrite * if ! &bin | :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")')) | endif

  augroup END

endif " has("autocmd")

" Plugin settings ============================================================

" NERD Tree

map <Leader>n :NERDTreeToggle<cr>

let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 40

" Supertab

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestHighlight = 1

" Ack

map <leader>a :Ack!<space>

" Powerline

let g:Powerline_symbols = 'fancy'

" CtrlP

let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['tag']

map <C-t> :CtrlPTag<CR>

