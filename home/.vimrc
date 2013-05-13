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

" Bundle 'jcf/vim-latex'
" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_MultipleCompileFormats='pdf, aux'
" let g:Tex_FoldedMisc = 'preamble,<<<'
" autocmd bufreadpre *.tex setlocal tabstop=2
" autocmd bufreadpre *.tex setlocal shiftwidth=2
" autocmd bufreadpre *.tex setlocal expandtab
" autocmd bufreadpre *.tex AcpLock

Bundle 'kien/ctrlp.vim'
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<esc>', '<c-q>'] }
noremap <leader>p :CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>

Bundle 'Lokaltog/vim-powerline'
set laststatus=2
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

Bundle 'git://git.code.sf.net/p/atp-vim/code'

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
set textwidth=79
set colorcolumn=80
highlight ColorColumn ctermbg=0

" Spell checking
autocmd BufRead *.tex,*.md setlocal spell spelllang=en_au
set spellfile=~/.vim/spell.en.add

" thesaurus
" autocmd BufRead *.tex,*.md setlocal thesaurus+=~/.vim/mthesaur.txt


" Key bindings

" Escape
inoremap jk <Esc>
inoremap <C-q> <Esc>
noremap <C-q> <Esc>
vnoremap <C-q> <Esc>
cmap <C-q> <C-c>

" Enter the command-line mode
noremap <leader><space> :

" Better command-line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Home row start / end
noremap H ^
noremap L $

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

" Cursor in omni-completion
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

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
