" Inspiration (I should probably say 'copying without understanding the

" Basic settings {{{
set nocompatible " Don't try to be vi compatible
filetype off " Helps force plugins to load correctly when it is turned back on below
syntax on " Turn on syntax highlighting
filetype plugin indent on " For plugins to load correctly

set modelines=0 " Security
set number " Show line numbers

if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif
if g:os ==? "darwin"
    set guifont=Menlo:h24
    " Temp fix for <CMD-.> not currently working as <Esc> in iVim.
    inoremap <D-.> <Esc>
endif

" Set up persistent undo across all files.
set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir

set ruler " Show file stats

set visualbell " Blink cursor on error instead of beeping (grr)

set encoding=utf-8 " Encoding

set wrap " Whitespace

set foldlevelstart=0

"set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
"}}}
" Cursor motion
set scrolloff=3
set backspace=indent,eol,start

set hidden " Allow hidden buffers

set ttyfast " Rendering

set laststatus=2 " Status bar

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Colorscheme {{{
" colorscheme murphy
colorscheme torte
" colorscheme desert
" colorscheme industry
" colorscheme darkblue
" }}}

" My key mappings {{{
" Define <leader> and <localleader>
let mapleader = ',' " Leader and local leader key set to ','
let maplocalleader = ','

"nnoremap j gj " Move up/down editor lines
"nnoremap k gk " Move up/down editor lines

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Edit $MYVIMRC
nnoremap <leader>ev :split $MYVIMRC<cr><C-w>_
nnoremap <leader>sv :source $MYVIMRC<cr>

" map a key to follow links (cannot type c-] on a Swedish keyboard)
nnoremap <leader>mn <C-]>

" Open previous buffer
nnoremap <leader>ff :execute "rightbelow split " . bufname("#")<cr>
" }}}

" Abbreviations {{{
iabbrev @@ klas.olsson@memoratus.se
iabbrev ssig -- <cr>Klas Olsson<cr>klas.olsson@memoratus.se
" }}}

" Temporary mappings during Learning vim the hard way exercise  {{{
" inoremap <c-u> <esc>viwUi
" nnoremap <c-u> viwU
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>lv`>l
nnoremap H 0
nnoremap L $
inoremap jk <esc>l
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap ip( :<c-u>normal! F(vi(<cr>

onoremap ilc :<c-u>normal! F}vi{<cr>
onoremap inc :<c-u>normal! f{vi{<cr>
onoremap alc :<c-u>normal! F}va{<cr>
onoremap anc :<c-u>normal! f}va{<cr>

" Highlight trailing whitespace; not done yet
nnoremap <leader>w :match Error /\v\s{1,}$/<CR>
nnoremap <leader>W :match<CR>
"onoremap in@ :<c-u>execute "normal! /\S*@\w*\.\w*\r:nohlsearch\rviW"<cr>

" }}}

" Vimscript file settings ---------------------- {{{
" Filetype Vim settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Auto load COBOL template {{{
augroup filetype_cobol
    autocmd!
    autocmd BufNewFile  *.cob      0r ~/lang/cobol/header.cob
    autocmd BufNewFile  *.cbl      0r ~/lang/cobol/header.cob
augroup END
" }}}
" Markdown settings {{{
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^\[=-\]\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^\[=-\]\\+$\r:nohlsearch\rg_vk0"<cr>
    autocmd FileType markdown :set statusline=%F
    autocmd FileType markdown :set statusline+=%=
    autocmd FileType markdown :set statusline+=%l
    autocmd FileType markdown :set statusline+=/
    autocmd FileType markdown :set statusline+=%L
augroup END
" }}}
" }}}
