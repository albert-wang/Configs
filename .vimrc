set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
" set expandtab


" turn syntax highlighting on
set t_Co=256
syntax on
colorscheme molokai

" turn line numbers on
set number

" highlight matching braces
set showmatch
set hlsearch
set incsearch

" Set the mouse.
se mouse=a

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
set guifont=inconsolata:h12

" Folding
set foldmethod=syntax
set foldnestmax=4

set equalalways
let mapleader = ","

nnoremap <leader>w :vsplit
nnoremap <leader>s <C-w>s<C-w>l
nnoremap <leader>q <C-w>q

nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l
nnoremap <C-Up> <C-w>j
nnoremap <C-Down> <C-w>k

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <leader>c <C-w>q
