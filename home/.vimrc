set nocompatible

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Leader key
let mapleader=" "

" Vundle setup
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'


" My bundles

Bundle 'bitc/vim-bad-whitespace'
nnoremap <leader>W :EraseBadWhitespace<CR>

Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'

Bundle 'goldfeld/vim-seek'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<esc>', '<c-q>'] }
noremap <leader>p :CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>

Bundle 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_complete_inlineMath = 1
autocmd bufreadpre *.tex let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
autocmd bufreadpre *.tex let g:SuperTabLongestHighlight = 1
autocmd bufreadpre *.tex setlocal tabstop=2
autocmd bufreadpre *.tex setlocal shiftwidth=2
autocmd bufreadpre *.tex setlocal expandtab
autocmd bufreadpre *.tex nmap <leader>t :LatexTOCToggle<CR>
autocmd bufreadpre *.tex imap <buffer> [[ \begin{
autocmd bufreadpre *.tex imap <buffer> ]] <Plug>LatexCloseCurEnv
autocmd bufreadpre *.tex nmap <buffer> <F5> <Plug>LatexChangeEnv
autocmd bufreadpre *.tex vmap <buffer> <F6> <Plug>LatexWrapSelection
autocmd bufreadpre *.tex vmap <buffer> <F7> <Plug>LatexEnvWrapSelection
autocmd bufreadpre *.tex AcpLock

Bundle 'Lokaltog/vim-powerline'
set laststatus=2
set noshowmode
set encoding=utf-8
let g:Powerline_symbols = 'unicode'

Bundle 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
noremap <f1> :NERDTreeToggle<CR>
noremap <f2> :NERDTreeFind<CR>

Bundle 'tomku/thesauri'
let g:mobythesaurus_file = '~/.vim/mthesaur.txt'
autocmd BufRead *.tex,*.md setlocal completefunc=CompleteThesauri

Bundle 'tpope/vim-abolish'

Bundle 'tpope/vim-commentary'

Bundle 'tpope/vim-fugitive'

Bundle 'tpope/vim-markdown'

Bundle 'tpope/vim-repeat'

Bundle 'tpope/vim-surround'

Bundle 'tpope/vim-unimpaired'

Bundle 'vim-scripts/Auto-Pairs'

Bundle 'vim-scripts/AutoComplPop'

Bundle 'vim-scripts/InsertChar'
nnoremap <leader>c :<C-u>call InsertChar#insert(v:count1)<CR>

Bundle 'vim-scripts/taglist.vim'
let Tlist_Auto_Update = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Close_On_Select = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
noremap <leader>t :TlistToggle<CR>

" End of my bundles


filetype plugin indent on

" Syntax highlighting and colorscheme
syntax on
" colorscheme molokai

" Allow unsaved changes when opening another file
set hidden

" Omni-completion
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" Search
set ignorecase
set smartcase
set incsearch

" Substitute all matches in the line
set gdefault

" History and undo sizes
set history=1000
set undolevels=1000

" Share the system clipboard
set clipboard=unnamedplus

" Wildmenu
set wildmenu
set wildmode=longest:full,full
set wildcharm=<Tab>

" Scrolling by blocks
set scrolloff=3
let &scrolljump=&lines / 2 - 1

" Terminal escape timeout
set ttimeout
set ttimeoutlen=100

" Extended backspace
set backspace=indent,eol,start

" Auto-indent
set autoindent

" Tab config
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable swap files
set noswapfile

" Move backup files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Line length and wrapping
set textwidth=80
set colorcolumn=81
highlight ColorColumn ctermbg=0

" Hide black line tildas
highlight NonText ctermfg=0

" Spell checking
autocmd BufRead *.tex,*.md setlocal spell spelllang=en_au
set spellfile=~/.vim/spell.en.add
nmap <leader>= 1z=


" Key bindings

" Escape
inoremap jk <Esc>
inoremap <C-q> <Esc>
noremap <C-q> <Esc>
vnoremap <C-q> <Esc>
cmap <C-q> <C-c>

" Enter the command-line mode
noremap <leader><Space> :

" Better command-line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Home row beginning / end of line
noremap H ^
noremap L $

" Insert mode beginning / end of line
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Insert mode delete a word forward
inoremap <C-d> <S-Right><C-w>

" Insert mode delete a character forward
inoremap <C-l> <Delete>

" Insert mode movement
inoremap <C-j> <S-Left>
inoremap <C-k> <S-Right>

" Save
noremap  <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>

" Quit
noremap Q :quit<CR>

" Reflow a paragraph
vmap <leader>q gq
nmap <leader>q gqap

" Jump between windows
noremap <leader>w <C-w>w
noremap <Up> <C-w>k
noremap <Down> <C-w>j
noremap <Left> <C-w>h
noremap <Right> <C-w>l

" Jump between buffers
noremap <silent> <leader>j :bnext<CR>
noremap <silent> <leader>k :bprev<CR>
noremap <silent> <leader>l :b#<CR>

" Delete the current buffer
noremap <leader>d :bdelete<CR>

" Edit a file
noremap <leader>e :e <Tab>

" Scroll screen with the cursor
noremap <C-j> j<C-e>
noremap <C-k> k<C-y>

" Sort in visual mode
vnoremap <leader>s :sort<CR>

" Moving blocks of text in visual mode
vnoremap < <gv
vnoremap > >gv

" Copy to the end of the line
map Y y$

" Up / down on wrapped lines
nnoremap j gj
nnoremap k gk

" Force saving that requires root permissions
cmap w!! %!sudo tee > /dev/null %

" Select all text
map <leader>a ggVG

" Easier increment / decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Duplicate a line and comment the first copy
nmap gcd yyPgcc

" Indent everything
noremap <leader>i gg=G<C-o><C-o>

" Switch capitalization of the first letter of the current word
nmap crf m`T<Space>~``

" Change current word - kill
noremap K ciw
