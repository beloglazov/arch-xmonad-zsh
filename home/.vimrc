set nocompatible

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc nested source %

" Leader key
let mapleader=" "

" Vundle setup
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'


" My bundles

Bundle 'beloglazov/vim-online-thesaurus'

Bundle 'bitc/vim-bad-whitespace'
nnoremap <leader>W :EraseBadWhitespace<CR>

Bundle 'davidhalter/jedi-vim'
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#popup_on_dot = 0
let g:jedi#pydoc = '<leader>K'
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 0
" let g:jedi#autocompletion_command = '<tab>'
let g:jedi#get_definition_command = '<leader>D'
autocmd FileType python let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
autocmd FileType python let g:SuperTabLongestHighlight = 1

Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'

Bundle 'goldfeld/vim-seek'

Bundle 'jiangmiao/auto-pairs'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<esc>', '<c-q>'] }
let g:ctrlp_max_height = 30
noremap <leader>p :CtrlP<CR>
noremap <leader>P :CtrlPCurFile<CR>
noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>r :CtrlPMRUFiles<CR>
noremap <leader>; :CtrlPLine<CR>

Bundle 'klen/python-mode'
let g:pymode_run = 0
let g:pymode_rope = 0
let g:pymode_folding = 0
" let g:pymode_indent = 0
let g:pymode_lint_cwindow = 0
let g:pymode_lint_message = 0
let g:pymode_doc_key = 'NONE'
let g:pymode_lint_ignore = 'W0401,E125'
let g:pymode_breakpoint_key = '<localleader>b'
let g:pymode_options = 0
autocmd FileType python noremap <F5> :PyLint<CR>
autocmd FileType python setlocal complete+=t
autocmd FileType python setlocal formatoptions-=t
autocmd FileType python setlocal nowrap
autocmd FileType python setlocal commentstring=#%s
" autocmd FileType python AcpLock
" autocmd FileType python source ~/.vim/google_python_style.vim

" Bundle 'kljohann/vim-python-pep8-indent'

Bundle 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_complete_inlineMath = 1
autocmd bufreadpre *.tex let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
autocmd bufreadpre *.tex let g:SuperTabLongestHighlight = 1
autocmd bufreadpre *.tex setlocal tabstop=2
autocmd bufreadpre *.tex setlocal softtabstop=2
autocmd bufreadpre *.tex setlocal shiftwidth=2
autocmd bufreadpre *.tex setlocal expandtab
autocmd bufreadpre *.tex nmap <leader>t :LatexTOCToggle<CR>
autocmd bufreadpre *.tex imap <buffer> [[ \begin{
autocmd bufreadpre *.tex imap <buffer> ]] <Plug>LatexCloseCurEnv
autocmd bufreadpre *.tex nmap <buffer> <F5> <Plug>LatexChangeEnv
autocmd bufreadpre *.tex vmap <buffer> <F6> <Plug>LatexWrapSelection
autocmd bufreadpre *.tex vmap <buffer> <F7> <Plug>LatexEnvWrapSelection
autocmd bufreadpre *.tex AcpLock

" Bundle 'millermedeiros/vim-statline'
Bundle 'beloglazov/vim-statline'
set noshowmode
set laststatus=2
let g:statline_fugitive = 1
let g:statline_show_n_buffers = 0
let g:statline_show_encoding = 0
let g:statline_filename_relative = 1

Bundle 'molok/vim-smartusline'
let g:smartusline_string_to_highlight = '[%n]'

Bundle 'scrooloose/nerdtree'
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['.*\.pyc$']
noremap <silent> <f1> :NERDTreeToggle<CR>
noremap <silent> <f2> :NERDTreeFind<CR>

Bundle 'tacahiroy/ctrlp-funky'
let g:ctrlp_extensions = ['funky']
nnoremap <leader>f :CtrlPFunky<CR>
" Narrow the list down with a word under cursor
nnoremap <leader>F :execute 'CtrlPFunky ' . expand('<cword>')<CR>

Bundle 'tpope/vim-abolish'

Bundle 'tpope/vim-commentary'

Bundle 'tpope/vim-fugitive'
noremap <silent> <f12> :Gstatus<CR>

Bundle 'tpope/vim-markdown'

Bundle 'tpope/vim-repeat'

Bundle 'tpope/vim-surround'

Bundle 'tpope/vim-unimpaired'

Bundle 'vim-scripts/AutoComplPop'
let g:acp_completeoptPreview = 1

Bundle 'vim-scripts/InsertChar'
nnoremap <leader><Space> :<C-u>call InsertChar#insert(v:count1)<CR>

Bundle 'vim-scripts/taglist.vim'
let Tlist_Auto_Update = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Close_On_Select = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
noremap <silent> <leader>t :TlistToggle<CR>

Bundle 'SirVer/ultisnips'

Bundle 'vim-scripts/YankRing.vim'
nnoremap <silent> <F3> :YRShow<CR>

" End of my bundles


filetype plugin indent on

" Syntax highlighting and colorscheme
syntax on
set t_Co=256
" colorscheme molokai
hi StatusLine   cterm=reverse ctermfg=233 ctermbg=4
hi StatusLineNC cterm=reverse ctermfg=233 ctermbg=8
hi VertSplit    cterm=reverse ctermfg=233 ctermbg=8
hi Search     ctermbg=NONE
hi Error      ctermbg=NONE ctermfg=red
hi SignColumn ctermbg=233
hi FoldColumn ctermbg=233

" Encoding
set encoding=utf-8

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
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc,*/.ropeproject/*,*.egg,*.egg-info/*

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
highlight ColorColumn ctermbg=233

" Hide black line tildas
highlight NonText ctermfg=0

" Spell checking
autocmd BufRead *.tex,*.md setlocal spell spelllang=en_au
set spellfile=~/.vim/spell.en.add
nmap <leader>= 1z=

" Yaml
autocmd bufreadpre *.yaml setlocal nowrap
autocmd bufreadpre *.yaml setlocal tabstop=2
autocmd bufreadpre *.yaml setlocal softtabstop=2
autocmd bufreadpre *.yaml setlocal shiftwidth=2


" Key bindings

" Open .vimrc
nnoremap <leader>ve :split $MYVIMRC<CR>

" Source .vimrc
nnoremap <leader>vs :source $MYVIMRC<CR>i<Esc>

" Escape
inoremap jk <Esc>`^
" inoremap kj <Esc>`^
inoremap <C-q> <Esc>`^
noremap <C-q> <Esc>
vnoremap <C-q> <Esc>
cmap <C-q> <C-c>

" Enter the command-line mode
noremap <CR> :

" Better command-line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Operator movements
onoremap p i(
onoremap b i{
onoremap ( i(
onoremap { i{
onoremap [ i[
onoremap < i<
onoremap q i'
onoremap ` i"
onoremap ' i'
onoremap " i"
onoremap np :<C-u>normal! f(lvi(<CR>
onoremap n( :<C-u>normal! f(lvi(<CR>
onoremap n{ :<C-u>normal! f{lvi{<CR>
onoremap nb :<C-u>normal! fblvib<CR>
onoremap n[ :<C-u>normal! f[lvi[<CR>
onoremap n< :<C-u>normal! f<lvi<<CR>
onoremap nq :<C-u>normal! f'lvi'<CR>
onoremap n` :<C-u>normal! f"lvi"<CR>
onoremap n' :<C-u>normal! f'lvi'<CR>
onoremap n" :<C-u>normal! f"lvi"<CR>

" Home row beginning / end of line
noremap H ^
noremap L $

" Insert mode movement
inoremap OO <Esc>o
inoremap CC <Esc>C
inoremap DD <C-o>dd
inoremap UU <C-o>u

" Insert mode beginning / end of line
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Insert mode delete a word forward
inoremap <C-d> <C-o>dw

" Insert mode dedent the current line
inoremap <C-f> <C-d>

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

" Center the screen with search jumps
noremap n nzz
noremap N Nzz

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
noremap <leader>I gg=G<C-o><C-o>

" Indent selection in visual mode
vnoremap <leader>i =

" Indent the current line
noremap <leader>i v=

" Switch capitalization of the first letter of the current word
nmap crf m`T<Space>~``

" Change current word - kill
noremap K ciw
