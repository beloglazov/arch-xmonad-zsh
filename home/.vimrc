set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'jcf/vim-latex'

filetype plugin indent on
syntax on
set ofu=syntaxcomplete#Complete  " omnicompletion
" colorscheme molokai

"set hlsearch
set ignorecase
set smartcase
set incsearch

set history=1000
set wildmenu
set wildmode=longest:full,full

set scrolloff=3
let &scrolljump=&lines / 2 - 1

set ttimeout
set ttimeoutlen=100

set backspace=indent,eol,start
set autoindent
set ruler  " cursor position
set showcmd  " display incomplete commands

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
noremap <C-b> :CtrlPBuffer<CR>

" latex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
noremap <f12> \ll

inoremap jk <esc>

noremap <C-j> j<C-e>
noremap <C-k> k<C-y>

noremap <Up> <PageUp>
noremap <Down> <PageDown>
noremap <Left> :bprev<CR>
noremap <Right> :bnext<CR>

noremap  <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>

noremap <f1> :NERDTreeToggle<CR>
noremap <f2> gqip
