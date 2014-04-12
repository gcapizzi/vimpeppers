set nocompatible

" Vundle =====================================================================

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles
Bundle 'Lokaltog/vim-powerline'
Bundle 'airblade/vim-gitgutter'
Bundle 'ivoputzer/vim-colors-flatland'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'matchit.zip'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" Local bundles ==============================================================

if filereadable(expand("~/.vimrc.bundles.local"))
    source ~/.vimrc.bundles.local
endif

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

" Colors =====================================================================

syntax on
set background=dark
set t_Co=256
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
  let g:solarized_termcolors=256
  let g:solarized_visibility="low"
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

" Easy tab navigation
map <S-Left> gT
map <S-Right> gt

" Substitute
nnoremap <leader>s :%s//<left>

" Clear search highlighting
map <C-l> :nohlsearch<CR>

" Fuck you, help key
noremap  <F1> <NOP>
inoremap <F1> <NOP>

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :tabe $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Save as root even if not root
cmap w!! %!sudo tee > /dev/null %

" Close QuickFix window
map <leader>q :cclose<CR>

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

map <C-t> :CtrlPTag<CR>
map <C-b> :CtrlPBuffer<CR>

" Rspec.vim

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" Local vimrc ================================================================

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
