set enc=utf-8
set fenc=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab

" turn syntax highlighting on
set termguicolors
syntax on

" turn line numbers on
set number

" highlight matching braces
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" No swap files
set nobackup

" Set the mouse.
se mouse=a

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
set guifont="Inconsolata Nerd Font Mono":h12

" Clipboard
set clipboard+=unnamedplus

" Folding
set foldmethod=syntax
set foldnestmax=4

set equalalways

nnoremap <C-z> u
nnoremap <C-y> <C-r>
nnoremap <M-z> u
nnoremap <M-y> <C-r>

nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l
nnoremap <C-Up> <C-w>j
nnoremap <C-Down> <C-w>k

nnoremap K <C-u>
nnoremap J <C-d>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Nvim stuff
lua require('config')

" Hide the command line when not being used
set cmdheight=0

:Neotree show

augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
augroup END
