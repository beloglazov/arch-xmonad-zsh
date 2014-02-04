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

Bundle 'aaronbieber/vim-quicktask'

Bundle 'arecarn/crunch'
nnoremap <leader>cr :Crunch<cr>

Bundle 'beloglazov/vim-online-thesaurus'

Bundle 'beloglazov/vim-statline'
set noshowmode
set laststatus=2
let g:statline_fugitive = 1
let g:statline_show_n_buffers = 0
let g:statline_show_encoding = 0
let g:statline_filename_relative = 1

Bundle 'bitc/vim-bad-whitespace'
nnoremap <leader>W :EraseBadWhitespace<CR>

Bundle 'bkad/CamelCaseMotion'
map W <Plug>CamelCaseMotion_w
map B <Plug>CamelCaseMotion_b
map E <Plug>CamelCaseMotion_e
omap <silent> iW <Plug>CamelCaseMotion_iw
xmap <silent> iW <Plug>CamelCaseMotion_iw
omap <silent> iB <Plug>CamelCaseMotion_ib
xmap <silent> iB <Plug>CamelCaseMotion_ib
omap <silent> iE <Plug>CamelCaseMotion_ie
xmap <silent> iE <Plug>CamelCaseMotion_ie

Bundle 'chrisbra/csv.vim'
hi CSVColumnEven ctermbg=0
" hi CSVColumnOdd  ctermbg=235
hi CSVColumnOdd  ctermbg=0
let g:csv_autocmd_arrange = 1
let g:csv_nomap_cr = 1
let g:csv_highlight_column = 'y'

Bundle 'davidhalter/jedi-vim'
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#completions_enable = 0
nnoremap <silent> <buffer> <leader>K :call jedi#show_documentation()<cr>
nnoremap <silent> <buffer> <leader>R :call jedi#rename()<cr>
nnoremap <silent> <buffer> <leader>U :call jedi#usages()<cr>

Bundle 'derekwyatt/vim-scala'
let g:scala_sort_across_groups=1
autocmd FileType scala setlocal textwidth=90
autocmd FileType scala setlocal colorcolumn=91
autocmd FileType scala setlocal tabstop=2
autocmd FileType scala setlocal softtabstop=2
autocmd FileType scala setlocal shiftwidth=2

Bundle 'dyng/ctrlsf.vim'
let g:ctrlsf_selected_line_hl = 'p'
nnoremap <F4> :CtrlSF<space>

Bundle 'fmoralesc/vim-pad'
let g:pad_dir = '~/notes'

Bundle 'ivyl/vim-bling'
let g:bling_no_map = 1
let g:bling_time = 50
let g:bling_count = 1
nnoremap <silent> n nzz:call BlingHighight()<CR>
nnoremap <silent> N Nzz:call BlingHighight()<CR>

Bundle 'JuliaLang/julia-vim'

Bundle 'junegunn/goyo.vim'
noremap <silent> <F7> :Goyo<cr>

Bundle 'justinmk/vim-sneak'
let g:sneak#f_reset = 0
let g:sneak#t_reset = 0
let g:sneak#streak = 0
nmap j <Plug>SneakNext
xmap j <Plug>VSneakNext
nmap k <Plug>SneakPrevious
xmap k <Plug>VSneakPrevious
map : <Plug>SneakStreakBackward
map ; <Plug>SneakStreak
" replace 'f' with inclusive 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" replace 't' with exclusive 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

Bundle 'kien/ctrlp.vim'
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<esc>', '<c-q>'] }
let g:ctrlp_max_height = 30
noremap <leader>o :CtrlP<CR>
noremap <leader>O :CtrlPCurFile<CR>
noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>r :CtrlPMRUFiles<CR>
noremap <leader>; :CtrlPLine<CR>

Bundle 'klen/python-mode'
let g:pymode_run = 0
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:pymode_indent = 0
let g:pymode_lint_cwindow = 0
let g:pymode_doc = 0
let g:pymode_doc_key = ''
let g:pymode_lint_ignore = 'W0401,E125,C901,C0110'
let g:pymode_breakpoint_key = '<localleader>b'
let g:pymode_options = 0
autocmd FileType python noremap <F5> :PyLint<CR>
autocmd FileType python setlocal complete+=t
autocmd FileType python setlocal formatoptions-=t
autocmd FileType python setlocal nowrap
autocmd FileType python setlocal commentstring=#%s

Bundle 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_complete_inlineMath = 1
autocmd BufReadPre *.tex setlocal tabstop=2
autocmd BufReadPre *.tex setlocal softtabstop=2
autocmd BufReadPre *.tex setlocal shiftwidth=2
autocmd BufReadPre *.tex setlocal expandtab
autocmd BufReadPre *.tex nmap <leader>t :LatexTOCToggle<CR>
autocmd BufReadPre *.tex imap <buffer> [[ \begin{
autocmd BufReadPre *.tex imap <buffer> ]] <Plug>LatexCloseCurEnv
autocmd BufReadPre *.tex nmap <buffer> <F5> <Plug>LatexChangeEnv
autocmd BufReadPre *.tex vmap <buffer> <F6> <Plug>LatexWrapSelection
autocmd BufReadPre *.tex vmap <buffer> <F7> <Plug>LatexEnvWrapSelection

Bundle 'majutsushi/tagbar'
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

Bundle 'mhinz/vim-startify'

Bundle 'michaeljsmith/vim-indent-object'

Bundle 'mileszs/ack.vim'

Bundle 'molok/vim-smartusline'
let g:smartusline_string_to_highlight = '[%n]'

Bundle 'python_match.vim'

Bundle 'Raimondi/delimitMate'
let delimitMate_balance_matchpairs = 1
au FileType python let b:delimitMate_nesting_quotes = ['"']

Bundle 'scrooloose/nerdtree'
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['.*\.pyc$']
noremap <silent> <f1> :NERDTreeToggle<CR>
noremap <silent> <f2> :NERDTreeFind<CR>

Bundle 'sickill/vim-pasta'

Bundle 'sk1418/Join'
noremap <silent> <leader>J :Join<cr>

" Bundle 'spiiph/vim-space'

Bundle 'tacahiroy/ctrlp-funky'
let g:ctrlp_extensions = ['funky']
nnoremap <leader>f :CtrlPFunky<CR>
" Narrow the list down with a word under cursor
nnoremap <leader>F :execute 'CtrlPFunky ' . expand('<cword>')<CR>

Bundle 'terryma/vim-expand-region'

Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_start_key = '<F6>'
let g:multi_cursor_quit_key = '<C-q>'

Bundle 'tfnico/vim-gradle'

Bundle 'tpope/vim-abolish'

Bundle 'tpope/vim-commentary'

Bundle 'tpope/vim-fugitive'
noremap <silent> <f12> :Gstatus<CR>

Bundle 'tpope/vim-markdown'

Bundle 'tpope/vim-repeat'

Bundle 'tpope/vim-surround'

Bundle 'milkypostman/vim-togglelist'
let g:toggle_list_no_mappings = 1
nnoremap <script> <silent> <f10> :call ToggleQuickfixList()<CR>

Bundle 'tpope/vim-unimpaired'

Bundle 'Valloric/python-indent'

Bundle 'Valloric/YouCompleteMe'
inoremap <C-@> <C-X><C-L>
inoremap <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_complete_in_comments = 1
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_key_detailed_diagnostics = '<leader>yd'
let g:EclimCompletionMethod = 'omnifunc'

" Bundle 'vim-scripts/InsertChar'
" nnoremap <leader><Space> :<C-u>call InsertChar#insert(v:count1)<CR>

Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<C-Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-z>"

Bundle 'vim-scripts/visualrepeat'

Bundle 'vim-scripts/YankRing.vim'
nnoremap <silent> <F3> :YRShow<CR>
function! YRRunAfterMaps()
    nnoremap Y :<C-U>YRYankCount 'y$'<CR>
endfunction

" End of my bundles


filetype plugin indent on

" Syntax highlighting and colorscheme
syntax on
set t_Co=256
" colorscheme molokai
hi StatusLine   cterm=reverse ctermfg=233 ctermbg=4
hi StatusLineNC cterm=reverse ctermfg=233 ctermbg=8
hi VertSplit    cterm=reverse ctermfg=233 ctermbg=8
hi Search       ctermbg=NONE
hi Error        ctermbg=NONE ctermfg=red
hi SignColumn   ctermbg=233
hi FoldColumn   ctermbg=233

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
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc,*/.ropeproject/*,*.egg,*.egg-info/*,*build/*,*bin/*,*target/*

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
autocmd BufReadPre *.yaml setlocal nowrap
autocmd BufReadPre *.yaml setlocal tabstop=2
autocmd BufReadPre *.yaml setlocal softtabstop=2
autocmd BufReadPre *.yaml setlocal shiftwidth=2
" autocmd BufEnter,BufNew,BufReadPost,BufWritePost *.yaml match yamlPathKeyword "\v[a-zA-Z_.*]+[a-zA-Z0-9-_.*]*/[a-zA-Z0-9-_.*/]*"
" highlight link yamlPathKeyword Keyword


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

onoremap q :<C-u>call <SID>SmartMotionsQuote()<CR>
nnoremap <leader>A :call <SID>GetClosestCharInFront()<CR>

function! s:GetClosestCharInFront()
    let s:chars = ['"', "'"]
    return s:GetClosestChar(s:chars, 1)
endfunction

function! s:GetClosestChar(chars, direction)
    " let s:chars = ['"', "'"]
    let s:line = getline('.')
    let s:col = col('.')
    if a:direction
        let s:range = range(s:col, len(s:line))
    else
        let s:range = range(0, s:col - 1)
    endif
    " echom s:col
    " echom s:line
    for s:c in s:range
        if index(a:chars, s:line[s:c]) > -1
            echom s:line[s:c]
            return
        endif
    endfor
    echom "Not found"
endfunction

" test 'qwe1' asd 'qwe' asd 'qwe3' asd
" test `qwe1` asd `qwe2` asd `qwe3` asd
function! s:SmartMotionsQuote()
    let s:line = getline('.')
    " let s:column = getpos('.')[2]
    let s:column = col('.')
    let s:lineHead = s:line[: s:column - 1]
    let s:lineTail = s:line[s:column :]
    let s:quotes = ["'", '"']
    let s:headQuoteCnts = {}
    let s:tailQuoteCnts = {}
    let s:totalQuoteCnts = {}

    " echom string(searchpos("'", 'cs'))

    for s:q in s:quotes
        let s:headQuoteCnts[s:q] = strlen(substitute(s:lineHead, '[^' . s:q . ']', '', 'g'))
        let s:tailQuoteCnts[s:q] = strlen(substitute(s:lineTail, '[^' . s:q . ']', '', 'g'))
        let s:totalQuoteCnts[s:q] = s:headQuoteCnts[s:q] + s:tailQuoteCnts[s:q]
    endfor

    for s:q in s:quotes
        " if s:headQuoteCnts[s:q] % 2 && !(s:totalQuoteCnts[s:q] % 2)
        if s:headQuoteCnts[s:q] % 2 && s:tailQuoteCnts[s:q] > 0
            exec 'normal! vi' . s:q
            return
        endif
    endfor

    for s:q in s:quotes
        if s:tailQuoteCnts[s:q] > 0
            exec 'normal! f' . s:q . 'lvi'. s:q
            return
        endif
    endfor

    for s:q in s:quotes
        if s:headQuoteCnts[s:q] > 0
            exec 'normal! F' . s:q . 'vi'. s:q
            return
        endif
    endfor
endfunction

" Home row beginning / end of line
noremap H ^
noremap L $

" C-Tab
imap <Esc>[27;5;9~ <C-Tab>
nmap <Esc>[27;5;9~ <C-Tab>
" imap <Esc>[27;6;9~ <C-S-Tab>

" Insert mode movement
inoremap OO <Esc>o
" inoremap CC <Esc>C
" inoremap DD <C-o>dd
inoremap UU <C-o>u

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-h> <Left>

" Insert mode delete a character forward
" inoremap <C-l> <Delete>

" Insert mode movement
" inoremap <C-j> <S-Left>
" inoremap <C-k> <S-Right>

" Insert mode beginning / end of line
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Insert mode delete a word forward
inoremap <C-d> <C-o>dw

" Insert mode dedent the current line
inoremap <C-f> <C-d>

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
noremap <C-j> gj<C-e>
noremap <C-k> gk<C-y>
noremap <C-h> h
noremap <C-l> l

" Very magic regex search by default
nnoremap / /\v

" Center the screen with search jumps
" noremap n nzz
" noremap N Nzz

" Sort in visual mode
vnoremap <leader>s :sort<CR>

" Moving blocks of text in visual mode
vnoremap < <gv
vnoremap > >gv

" Copy the selected region and jump to its end
vmap y y`]

" Up / down on wrapped lines
" nnoremap j gj
" nnoremap k gk

" Force saving that requires root permissions
cmap w!! %!sudo tee > /dev/null %

" Select all text
map <leader>a ggVG

" Easier increment / decrement
" nnoremap + <C-a>
" nnoremap - <C-x>

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

" Change current WORD - kill
noremap J ciW

" Search the current word in front / behind
noremap h #
noremap l *

" Jump to the matching brace
noremap , %

" Join lines
" nnoremap <leader>J J

" Insert a space
nnoremap <leader><Space> i<Space><Esc>

" Java key bindings
autocmd FileType java nnoremap <silent> <buffer> <localleader>i :JavaImport<cr>
autocmd FileType java nnoremap <silent> <buffer> <localleader>o :JavaImportOrganize<cr>
autocmd FileType java nnoremap <silent> <buffer> <localleader>d :JavaDocSearch -x declarations<cr>
autocmd FileType java nnoremap <silent> <buffer> <localleader>s :JavaSearchContext<cr>
autocmd FileType java nnoremap <silent> <buffer> <localleader>c :JavaCorrect<cr>
autocmd FileType java nnoremap <silent> <buffer> <localleader>f :%JavaFormat<cr>
autocmd FileType java nnoremap <silent> <buffer> <localleader>h :JavaHierarchy<cr>
autocmd FileType java nnoremap <buffer> <localleader>rr :JavaRename<space>
autocmd FileType java nnoremap <buffer> <localleader>rm :JavaMove<space>
autocmd FileType java nnoremap <silent> <buffer> <localleader>ru :RefactorUndo<cr>

