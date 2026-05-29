" ===== 기본 설정 =====
syntax on
set number
set relativenumber
set mouse=a
set termguicolors
set background=dark

" ===== 플러그인 =====
if filereadable(expand('~/.vim/autoload/plug.vim'))
  call plug#begin('~/.vim/plugged')
  Plug 'nordtheme/vim'
  Plug 'vim-airline/vim-airline'
  call plug#end()
endif

" ===== 테마 =====
try
  colorscheme nord
catch
  colorscheme habamax
endtry
highlight Normal guibg=NONE ctermbg=NONE

" ===== 상태줄 =====
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1

" ===== 리더키 =====
let mapleader = " "

" ===== 들여쓰기 =====
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
filetype plugin indent on

" ===== 검색 =====
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <leader><space> :nohlsearch<CR>

" ===== 편의 설정 =====
set encoding=utf-8
set fileencoding=utf-8
set scrolloff=8
set signcolumn=yes
set cursorline
set nowrap
set showmatch
set wildmenu
set wildmode=longest:full,full
set backspace=indent,eol,start
set clipboard=unnamed

" ===== 분할 화면 =====
set splitbelow
set splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ===== 불필요한 파일 방지 =====
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
