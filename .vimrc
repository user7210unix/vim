set encoding=utf-8
scriptencoding utf-8
set nocompatible

" Auto-install vim-plug on first start
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = " "
let maplocalleader = ","


set number
set cursorline
set scrolloff=8
set sidescrolloff=8
set hidden
set nowrap
set mouse=a
set noshowmode                     " mode is shown in the statusline
set showcmd
set ruler
set laststatus=2
set signcolumn=yes
set updatetime=300
set timeoutlen=500
set ttimeoutlen=10
set belloff=all
set backspace=indent,eol,start
set virtualedit=block
set shortmess+=c
set completeopt=menuone,noinsert,noselect
set pumheight=12
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/node_modules/*,*/target/*,*/build/*,*/.git/*,*.class,*.jar
set include=
silent! set ttymouse=sgr

" Files: no swap/backup clutter, persistent undo, auto reload
set noswapfile
set nobackup
set nowritebackup
set autoread
set autowrite
set undofile
silent! call mkdir(expand('~/.vim/undo'), 'p')
set undodir=~/.vim/undo//
if has('clipboard')
    set clipboard=unnamedplus
endif

" Indentation & Tabs (per-filetype overrides further below)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Folding (off by default, za to toggle)
set foldmethod=indent
set foldlevelstart=99

" Invisible characters (Consolas-safe)
set list
set listchars=tab:→\ ,trail:·,extends:>,precedes:<,nbsp:+
set fillchars=vert:│,fold:─
silent! set fillchars+=eob:\ 
silent! set fillchars+=stl:\ ,stlnc:\ 

" Window splits
set splitbelow
set splitright

" Cursor shape: bar in insert, block in normal, underline in replace
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"
" Italic comments
let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"
let &t_ut = ''

" Filetype & syntax
filetype plugin indent on
syntax on


" Let polyglot stay out of the way of the filetype plugins below
let g:polyglot_disabled = ['rust', 'pug', 'gdscript', 'org']
let g:vim_json_syntax_conceal = 0

call plug#begin('~/.vim/plugged')

" --- Language intelligence (Java, JS/TS, JSON, HTML, CSS) ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'                " better syntax + indent for 200+ languages

" --- Look & feel ---
Plug 'mhinz/vim-startify'                  " start screen with recent files/sessions
Plug 'Yggdroot/indentLine'                 " indent guides
Plug 'luochen1990/rainbow'                 " rainbow brackets (palette colors)
Plug 'machakann/vim-highlightedyank'       " flash yanked text
Plug 'psliwka/vim-smoothie'                " smooth scrolling for C-d/C-u/C-f/C-b
Plug 'airblade/vim-gitgutter'              " git diff signs in the gutter

" --- Editing ---
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'                " ]b [b ]q [q ]<Space> ...
Plug 'triglav/vim-visual-increment'
Plug 'sagarrakshe/toggle-bool'

" --- Navigation & git ---
Plug 'scrooloose/nerdtree'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- Filetype-specific ---
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'quabug/vim-gdscript', { 'for': 'gdscript' }
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'tpope/vim-speeddating', { 'for': 'org' }

call plug#end()


"  0 #3F3F3F  black      8  #709080  bright black (comments)
"  1 #705050  red        9  #DCA3A3  bright red
"  2 #60B48A  green     10  #72D5A3  bright green
"  3 #DFAF8F  yellow    11  #F0DFAF  bright yellow
"  4 #9AB8D7  blue      12  #94BFF3  bright blue
"  5 #DC8CC3  magenta   13  #EC93D3  bright magenta
"  6 #8CD0D3  cyan      14  #93E0E3  bright cyan
"  7 #DCDCCC  white     15  #FFFFFF  bright white
set background=dark
highlight clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name = 'darkpastels'

" --- Editor UI ---
hi Normal       ctermfg=NONE ctermbg=NONE
hi NonText      ctermfg=0    ctermbg=NONE
hi SpecialKey   ctermfg=0    ctermbg=NONE
hi Whitespace   ctermfg=0    ctermbg=NONE
hi Conceal      ctermfg=0    ctermbg=NONE
hi CursorLine   ctermbg=0    cterm=NONE
hi CursorColumn ctermbg=0
hi ColorColumn  ctermbg=0
hi LineNr       ctermfg=8    ctermbg=NONE
hi CursorLineNr ctermfg=11   ctermbg=0 cterm=bold
hi SignColumn   ctermfg=8    ctermbg=NONE
hi FoldColumn   ctermfg=8    ctermbg=NONE
hi Folded       ctermfg=8    ctermbg=0 cterm=italic
hi VertSplit    ctermfg=0    ctermbg=NONE cterm=NONE
hi! link WinSeparator VertSplit
hi Visual       ctermfg=0    ctermbg=4
hi Search       ctermfg=0    ctermbg=11
hi IncSearch    ctermfg=0    ctermbg=3 cterm=NONE
hi CurSearch    ctermfg=0    ctermbg=3 cterm=bold
hi MatchParen   ctermfg=15   ctermbg=8 cterm=bold
hi Pmenu        ctermfg=7    ctermbg=0
hi PmenuSel     ctermfg=0    ctermbg=4 cterm=bold
hi PmenuSbar    ctermbg=0
hi PmenuThumb   ctermbg=8
hi WildMenu     ctermfg=0    ctermbg=11
hi TabLine      ctermfg=8    ctermbg=0 cterm=NONE
hi TabLineSel   ctermfg=0    ctermbg=4 cterm=bold
hi TabLineFill  ctermfg=8    ctermbg=0 cterm=NONE
hi Directory    ctermfg=12
hi Title        ctermfg=11   cterm=bold
hi ErrorMsg     ctermfg=9    ctermbg=NONE cterm=bold
hi WarningMsg   ctermfg=3
hi ModeMsg      ctermfg=11   cterm=bold
hi MoreMsg      ctermfg=10
hi Question     ctermfg=10
hi SpellBad     ctermfg=9    ctermbg=NONE cterm=underline
hi SpellCap     ctermfg=3    ctermbg=NONE cterm=underline
hi SpellRare    ctermfg=13   ctermbg=NONE cterm=underline
hi SpellLocal   ctermfg=14   ctermbg=NONE cterm=underline
hi DiffAdd      ctermfg=10   ctermbg=0
hi DiffChange   ctermfg=3    ctermbg=0
hi DiffDelete   ctermfg=9    ctermbg=0
hi DiffText     ctermfg=0    ctermbg=3

" --- Syntax ---
hi Comment        ctermfg=8  cterm=italic
hi SpecialComment ctermfg=14 cterm=italic
hi Todo           ctermfg=0  ctermbg=11 cterm=bold
hi Constant       ctermfg=13
hi String         ctermfg=9
hi Character      ctermfg=9
hi Number         ctermfg=6
hi Float          ctermfg=6
hi Boolean        ctermfg=13 cterm=bold
hi Identifier     ctermfg=NONE cterm=NONE
hi Function       ctermfg=11
hi Statement      ctermfg=3  cterm=bold
hi Operator       ctermfg=7
hi PreProc        ctermfg=10
hi Type           ctermfg=12
hi Special        ctermfg=14
hi Delimiter      ctermfg=7
hi Underlined     ctermfg=12 cterm=underline
hi Ignore         ctermfg=8
hi Error          ctermfg=15 ctermbg=1

" Java / JavaScript refinements
let g:java_highlight_all = 1
let g:java_highlight_functions = 'style'
hi! link javaFuncDef     Function
hi! link javaAnnotation  PreProc
hi! link javaScriptBraces Delimiter
hi! link jsFuncCall      Function
hi! link jsThis          Constant
hi! link jsStorageClass  Statement

" --- Plugin highlights ---
hi CocMenuSel              ctermfg=0 ctermbg=4 cterm=bold
hi CocErrorSign            ctermfg=9
hi CocWarningSign          ctermfg=3
hi CocInfoSign             ctermfg=12
hi CocHintSign             ctermfg=14
hi CocErrorVirtualText     ctermfg=9  cterm=italic
hi CocWarningVirtualText   ctermfg=3  cterm=italic
hi CocInfoVirtualText      ctermfg=12 cterm=italic
hi CocHintVirtualText      ctermfg=8  cterm=italic
hi CocErrorHighlight       cterm=underline
hi CocWarningHighlight     cterm=underline
hi CocInfoHighlight        cterm=underline
hi CocHintHighlight        cterm=underline
hi CocHighlightText        ctermbg=0
hi CocInlayHint            ctermfg=8 ctermbg=NONE cterm=italic
hi CocUnusedHighlight      ctermfg=8
hi CocDeprecatedHighlight  cterm=strikethrough
hi CocFloatDividingLine    ctermfg=8
hi CocSearch               ctermfg=11
hi GitGutterAdd            ctermfg=10 ctermbg=NONE
hi GitGutterChange         ctermfg=3  ctermbg=NONE
hi GitGutterDelete         ctermfg=9  ctermbg=NONE
hi HighlightedyankRegion   ctermfg=0  ctermbg=11
hi StartifyHeader          ctermfg=4
hi StartifySection         ctermfg=11 cterm=bold
hi StartifyNumber          ctermfg=6
hi StartifyFile            ctermfg=7
hi StartifyPath            ctermfg=8
hi StartifySlash           ctermfg=8
hi StartifyBracket         ctermfg=8
hi StartifySpecial         ctermfg=8

" --- Statusline colors ---
hi StatusLine     ctermfg=7  ctermbg=0 cterm=NONE
hi StatusLineNC   ctermfg=8  ctermbg=0 cterm=NONE
hi! link StatusLineTerm   StatusLine
hi! link StatusLineTermNC StatusLineNC
hi StlN      ctermfg=0  ctermbg=4  cterm=bold
hi StlI      ctermfg=0  ctermbg=10 cterm=bold
hi StlV      ctermfg=0  ctermbg=13 cterm=bold
hi StlR      ctermfg=0  ctermbg=9  cterm=bold
hi StlC      ctermfg=0  ctermbg=11 cterm=bold
hi StlT      ctermfg=0  ctermbg=14 cterm=bold
hi StlBranch ctermfg=12 ctermbg=0
hi StlFt     ctermfg=14 ctermbg=0
hi StlDim    ctermfg=8  ctermbg=0
hi StlErr    ctermfg=9  ctermbg=0  cterm=bold
hi StlWarn   ctermfg=3  ctermbg=0  cterm=bold
hi StlPos    ctermfg=0  ctermbg=8  cterm=bold
hi StlNC     ctermfg=8  ctermbg=0


"  [ MODE ] branch  path/to/File.java [+]        E:2 W:1  coc-status  java  42:7  63%
let s:stl_modes = {
    \ 'n':      ['NORMAL',   'StlN'],
    \ 'i':      ['INSERT',   'StlI'],
    \ 'R':      ['REPLACE',  'StlR'],
    \ 'v':      ['VISUAL',   'StlV'],
    \ 'V':      ['V-LINE',   'StlV'],
    \ "\<C-v>": ['V-BLOCK',  'StlV'],
    \ 's':      ['SELECT',   'StlV'],
    \ 'S':      ['S-LINE',   'StlV'],
    \ 'c':      ['COMMAND',  'StlC'],
    \ 't':      ['TERMINAL', 'StlT'],
    \ '!':      ['SHELL',    'StlT'],
    \ }

function! StlBranch() abort
    try
        return substitute(gitbranch#name(), '%', '%%', 'g')
    catch
        return ''
    endtry
endfunction

function! StlDiag() abort
    let l:info = get(b:, 'coc_diagnostic_info', {})
    let l:out = ''
    if get(l:info, 'error', 0) > 0
        let l:out .= '%#StlErr# E:' . l:info['error'] . ' '
    endif
    if get(l:info, 'warning', 0) > 0
        let l:out .= '%#StlWarn# W:' . l:info['warning'] . ' '
    endif
    return l:out
endfunction

function! StlRender() abort
    if g:statusline_winid != win_getid()
        return '%#StlNC# %f %m%=%y %l:%v '
    endif
    if mode() ==# 'nt'
        let l:m = ['T-NORMAL', 'StlT']
    else
        let l:m = get(s:stl_modes, mode()[0], ['NORMAL', 'StlN'])
    endif
    let l:s = '%#' . l:m[1] . '# ' . l:m[0] . ' '
    let l:br = StlBranch()
    if !empty(l:br)
        let l:s .= '%#StlBranch# ' . l:br . ' '
    endif
    let l:s .= '%#StatusLine# %f %#StlDim#%m%r%h%w'
    let l:s .= '%#StatusLine#%='
    let l:s .= StlDiag()
    let l:coc = substitute(strpart(get(g:, 'coc_status', ''), 0, 40), '%', '%%', 'g')
    if !empty(l:coc)
        let l:s .= '%#StlDim# ' . l:coc . ' '
    endif
    let l:ft = empty(&filetype) ? 'plain' : &filetype
    let l:s .= '%#StlFt# ' . l:ft . ' '
    if &fileencoding !=# 'utf-8' && !empty(&fileencoding)
        let l:s .= '%#StlDim#' . &fileencoding . ' '
    endif
    if &fileformat !=# 'unix'
        let l:s .= '%#StlDim#' . &fileformat . ' '
    endif
    let l:s .= '%#StlPos# %l:%v %#StlN# %p%% '
    return l:s
endfunction

set statusline=%!StlRender()


" --- Startify ---
let g:startify_custom_header = 'startify#center(["V I M", "", "java  ·  javascript"])'
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_files_number = 8
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Recent files'] },
    \ { 'type': 'dir',       'header': ['   Recent in ' . getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions'] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
    \ ]

" --- IndentLine ---
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_concealcursor = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude = ['json', 'markdown', 'help', 'startify', 'nerdtree', 'terminal', 'text']
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'nofile']

" --- Rainbow brackets (colors from the terminal palette) ---
let g:rainbow_active = 1
let g:rainbow_conf = {
    \ 'ctermfgs': [12, 11, 13, 14, 10, 9],
    \ 'separately': { 'nerdtree': 0, 'startify': 0 },
    \ }

" --- GitGutter ---
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '~'

" --- Highlighted yank ---
let g:highlightedyank_highlight_duration = 200

" --- NERDTree ---
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeIgnore = ['\.pyc$', '\.o$', '\.class$', '^node_modules$', '^target$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 32
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" --- CoC (Conquer of Completion) ---
let g:coc_global_extensions = [
    \ 'coc-java',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-pairs',
    \ ]
let g:coc_config_home = expand('~/.vim')

" --- FZF ---
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
    \   'bg':      ['bg', 'Normal'],
    \   'hl':      ['fg', 'Statement'],
    \   'fg+':     ['fg', 'CursorLine', 'CursorColumn'],
    \   'bg+':     ['bg', 'CursorLine'],
    \   'hl+':     ['fg', 'Statement'],
    \   'info':    ['fg', 'Comment'],
    \   'border':  ['fg', 'Comment'],
    \   'prompt':  ['fg', 'Identifier'],
    \   'pointer': ['fg', 'Statement'],
    \   'marker':  ['fg', 'Statement'],
    \   'spinner': ['fg', 'Statement'],
    \   'header':  ['fg', 'Comment'] }


function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Remove trailing whitespace
command! Trim let s:v = winsaveview() | keeppatterns %s/\s\+$//e | call winrestview(s:v)

" Run any shell command in a bottom terminal:  :T mvn test
command! -nargs=+ -complete=shellcmd T botright terminal ++rows=14 <args>

" Run the current file (Java 11+ single-file launcher, or node)
function! RunFile() abort
    silent! write
    let l:f = shellescape(expand('%:p'))
    if &filetype ==# 'java'
        let l:cmd = 'java ' . l:f
    elseif &filetype ==# 'javascript'
        let l:cmd = 'node ' . l:f
    else
        echo 'No runner for filetype: ' . &filetype
        return
    endif
    execute 'botright terminal ++rows=14 ' . l:cmd
endfunction

" Toggle a persistent terminal at the bottom (keeps your shell session alive)
let g:term_buf = 0
let g:term_win = 0
function! ToggleTerminal() abort
    if g:term_win != 0 && win_gotoid(g:term_win)
        hide
        let g:term_win = 0
        return
    endif
    botright 14split
    if g:term_buf != 0 && bufexists(g:term_buf) && getbufvar(g:term_buf, '&buftype') ==# 'terminal'
        execute 'buffer' g:term_buf
        setlocal nonumber norelativenumber signcolumn=no nolist nocursorline
        if mode() ==# 'n'
            silent! normal! i
        endif
    else
        terminal ++curwin
        let g:term_buf = bufnr('%')
    endif
    let g:term_win = win_getid()
endfunction



" --- Basics ---
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>
nnoremap <leader>x :bp\|bd #<CR>
nnoremap <silent> <leader><CR> :nohlsearch<CR>
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
xnoremap < <gv
xnoremap > >gv
xnoremap p "_dP
xnoremap <silent> J :m '>+1<CR>gv=gv
xnoremap <silent> K :m '<-2<CR>gv=gv

" --- Window navigation ---
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>
nnoremap <leader>s= <C-w>=

" --- Method navigation ---
nnoremap <C-Up> [m
nnoremap <C-Down> ]m

" --- File explorer & fuzzy finding ---
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <silent> / :BLines<CR>
nnoremap g/ /
nnoremap <leader>/  :BLines<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>f: :Commands<CR>
nnoremap <leader>fc :Commits<CR>

" --- Git ---
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gl :Git log --oneline<CR>
nmap ]h <Cmd>GitGutterNextHunk<CR>
nmap [h <Cmd>GitGutterPrevHunk<CR>
nnoremap <leader>hp :GitGutterPreviewHunk<CR>
nnoremap <leader>hs :GitGutterStageHunk<CR>
nnoremap <leader>hu :GitGutterUndoHunk<CR>

" --- Terminal ---
"  :term          -> opens a 14-line terminal at the bottom (see abbreviation below)
"  <F12>          -> toggle a persistent terminal (works from every mode)
"  <Esc><Esc>     -> terminal mode to normal mode (scroll/copy)
"  <C-w> h/j/k/l  -> jump out of the terminal to another window
"  entering a terminal window drops you straight into typing mode
cnoreabbrev <expr> term (getcmdtype() ==# ':' && getcmdline() ==# 'term') ? 'botright terminal ++rows=14' : 'term'
nnoremap <silent> <F12> :call ToggleTerminal()<CR>
inoremap <silent> <F12> <Esc>:call ToggleTerminal()<CR>
tnoremap <silent> <F12> <C-\><C-n>:call ToggleTerminal()<CR>
nnoremap <silent> <leader>tt :call ToggleTerminal()<CR>
nnoremap <leader>tv :vertical terminal<CR>
nnoremap <silent> <leader>rr :call RunFile()<CR>
nnoremap <leader>rm :T mvn -q test<CR>
nnoremap <leader>rg :T ./gradlew test<CR>
nnoremap <leader>rn :T npm test<CR>
tnoremap <Esc><Esc> <C-\><C-n>

" --- CoC completion ---
inoremap <silent><expr> <Tab>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR>
    \ coc#pum#visible() ? coc#pum#confirm() :
    \ "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent> <C-e> <C-r>=coc#pum#cancel()<CR>

" --- CoC navigation ---
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" --- CoC actions (c = code) ---
nmap <silent> <leader>cr <Plug>(coc-rename)
nmap <silent> <leader>ca <Plug>(coc-codeaction-cursor)
xmap <silent> <leader>ca <Plug>(coc-codeaction-selected)
nmap <silent> <leader>cq <Plug>(coc-fix-current)
nnoremap <silent> <leader>cf :call CocActionAsync('format')<CR>
xmap <silent> <leader>cf <Plug>(coc-format-selected)
nnoremap <silent> <leader>co :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
nnoremap <silent> <leader>cd :CocList diagnostics<CR>
nnoremap <silent> <leader>cs :CocList -I symbols<CR>
nnoremap <silent> <leader>cu :CocList outline<CR>
nnoremap <silent> <leader>cc :CocList commands<CR>
nnoremap <silent> <leader>cR :CocRestart<CR>

" Function / class text objects (af, if, ac, ic)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


augroup user_settings
    autocmd!
    " Per-language indentation
    autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4
    autocmd FileType javascript,javascriptreact,typescript,typescriptreact,json,jsonc,html,css,scss,yaml,xml,pug
        \ setlocal shiftwidth=2 tabstop=2 softtabstop=2
    " Do not continue comments when pressing o/O
    autocmd FileType * setlocal formatoptions-=o
    " Restore cursor position
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &filetype !~# 'commit'
        \ | execute "normal! g`\"" | endif
    " Reload files changed outside of Vim
    autocmd FocusGained,BufEnter * silent! checktime
    " Equalize splits when the terminal window is resized
    autocmd VimResized * wincmd =
augroup END

augroup active_cursorline
    autocmd!
    autocmd WinEnter,BufEnter * if &buftype !=# 'terminal' | setlocal cursorline | endif
    autocmd WinLeave * setlocal nocursorline
augroup END

augroup terminal_settings
    autocmd!
    autocmd TerminalWinOpen * setlocal nonumber norelativenumber signcolumn=no nolist nocursorline scrolloff=0
    " Moving into a terminal window puts you straight into typing mode
    autocmd WinEnter * if &buftype ==# 'terminal' && mode() ==# 'n' | silent! normal! i | endif
augroup END

augroup coc_hooks
    autocmd!
    autocmd CursorHold * silent! call CocActionAsync('highlight')
    autocmd User CocStatusChange,CocDiagnosticChange redrawstatus
    autocmd FileType java,javascript,typescript,json setlocal formatexpr=CocAction('formatSelected')
augroup END

augroup nerdtree_hooks
    autocmd!
    " Close Vim if NERDTree is the last window
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END
