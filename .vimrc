set cursorline
set scrolloff=5
set sidescrolloff=5
set hidden
set nowrap
set mouse=a
set noshowmode
set nocompatible
set tabstop=4
set showmode
set ruler
set list
set listchars=tab:→\ ,trail:·,extends:>,precedes:<
set shiftwidth=4
set expandtab
set number
set autoindent
set hlsearch
set incsearch
set include=
set splitbelow
set splitright

filetype plugin indent on
syntax on

" Replace Vim's / search with fzf
nnoremap <silent> / :BLines<CR>

" Vim Plug
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'triglav/vim-visual-increment'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/vim-gitbranch'
Plug 'sagarrakshe/toggle-bool'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'quabug/vim-gdscript', { 'for': 'gdscript' }
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'tpope/vim-speeddating', { 'for': 'org' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set background=dark
let base16colorspace=256

colorscheme base16-default-dark

if !has('gui_running')
    hi Normal ctermbg=NONE guibg=NONE
    hi NormalNC ctermbg=NONE guibg=NONE
    hi LineNr ctermbg=NONE guibg=NONE
    hi SignColumn ctermbg=NONE guibg=NONE
    hi EndOfBuffer ctermbg=NONE guibg=NONE
    hi StatusLine ctermbg=NONE guibg=NONE
    hi StatusLineNC ctermbg=NONE guibg=NONE
endif

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_default'

let g:airline_section_b = '%{gitbranch#name()}'
let g:airline_section_c = '%f'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_y = '%l:%c'
let g:airline_section_z = '%p%%'

let g:coc_global_extensions = ['coc-java']

set updatetime=300
set signcolumn=yes
set completeopt=menuone,noinsert,noselect

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


" Don't show suggestions when we don't explicitly ask for them.
let g:coc_config_home = expand('~/.vim')

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Tab:
"   - move through completion menu
"   - insert a real tab at whitespace
"   - otherwise trigger completion
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()

" FZF / Consult-like navigation

" Current buffer lines
nnoremap <leader>/ :BLines<CR>

" Files
nnoremap <leader>f :Files<CR>

" Buffers
nnoremap <leader>b :Buffers<CR>

" Recent files
nnoremap <leader>o :History<CR>

" Commands
nnoremap <leader>: :Commands<CR>

" Marks
nnoremap <leader>m :Marks<CR>

" Help
nnoremap <leader>h :Helptags<CR>

inoremap <silent><expr> <S-Tab>
    \ pumvisible() ? "\<C-p>" :
    \ "\<C-h>"

" Enter:
"   - accept selected completion
"   - otherwise insert newline normally
inoremap <silent><expr> <CR>
    \ pumvisible() ? coc#_select_confirm() :
    \ "\<C-g>u\<CR>"

" Escape closes completion cleanly
inoremap <silent> <C-e> <C-r>=coc#cancel()<CR>

" Manually trigger completion
inoremap <silent> <C-Space> <C-o>:call coc#refresh()<CR>

" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" Go to type definition
nmap <silent> gy <Plug>(coc-type-definition)

" Find references
nmap <silent> gr <Plug>(coc-references)

" Rename symbol
nmap <silent> <leader>rn <Plug>(coc-rename)

" Format current file
nmap <silent> <leader>f :call CocActionAsync('format')<CR>

" Show documentation
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Diagnostics
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" Show diagnostics for current line
nnoremap <silent> <leader>d :CocList diagnostics<CR>

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi Search ctermbg=yellow ctermfg=black
hi PmenuSel ctermbg=yellow ctermfg=black
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeIgnore = ['\.pyc$','\.o$']
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_default'
let g:airline_mode_map = {
        \ '__' : '------',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ 'c'  : 'C',
        \ '␖' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '␓' : 'S',
        \ 't'  : 'T',
        \ }
let g:airline_section_b = '[%{gitbranch#name()}]'
