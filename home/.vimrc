set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'ervandew/supertab'
Bundle 'goldfeld/vim-seek'
Bundle 'jcf/vim-latex'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'vim-scripts/InsertChar'
Bundle 'vim-scripts/taglist.vim'

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

let Tlist_Auto_Update = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Close_On_Select = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Highlight_Tag_On_BufEnter = 1

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
noremap <C-b> :CtrlPBuffer<CR>

" latex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_FoldedMisc = 'preamble,<<<'
autocmd bufreadpre *.tex,*.txt,*.md setlocal textwidth=80
autocmd bufreadpre *.tex setlocal tabstop=2
autocmd bufreadpre *.tex setlocal shiftwidth=2
autocmd bufreadpre *.tex setlocal expandtab
noremap <f12> \ll

inoremap jk <esc>

noremap <C-j> j<C-e>
noremap <C-k> k<C-y>

noremap <Up> <PageUp>
noremap <Down> <PageDown>
noremap <Left> :bprev<CR>
noremap <Right> :bnext<CR>

nnoremap <SPACE> :<C-U>call InsertChar#insert(v:count1)<CR>

noremap  <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>

noremap <f1> :NERDTreeToggle<CR>
noremap <f2> :TlistToggle<CR>
noremap <f3> gqip
