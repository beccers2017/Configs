set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'octal/vim-cpp-enhanced-highlight'
Plugin 'yggdroot/indentLine'
Plugin 'thaerkh/vim-workspace'
Plugin 'wellle/visual-split.vim'
Plugin 'mattboehm/vim-accordian'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'
"Plugin 'lokaltog/vim-powerline'
Plugin 'itchyny/lightline.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mbbill/undotree'
Plugin 'townk/vim-autoclose'
Plugin 'hdima/python-syntax'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'scrooloose/syntastic'
call vundle#end()

filetype plugin on
filetype plugin indent on

set autoread
set cmdheight=2
set number
set wrap
set textwidth=100
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set smarttab
set noexpandtab
set showmode

set nobackup
set nowritebackup
set noswapfile

set history=999
set undolevels=999

set hlsearch
set incsearch
set ignorecase smartcase
set esckeys

"set t_Co=256
syntax on
set background=dark

set showmatch
set title
set noerrorbells
set visualbell
set t_vb=
set nomodeline
set backspace=indent,eol,start
set mouse=a
set showbreak=>\
set nowb
set hidden
scriptencoding=utf-8
set laststatus=2
set noshowmode
if !has('gui_running')
	set t_Co=256
endif

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

