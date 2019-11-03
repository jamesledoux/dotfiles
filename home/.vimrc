set nocompatible              " required
filetype off                  " required

"Disable beeps
set visualbell
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set runtimepath^=~/.vim/bundle/fastfold.vim
" http://github.com/Konfekt/FastFold/blob/master/plugin/fastfold.vim  
set runtimepath^=~/.vim/bundle/SimpylFold.vim
" https://raw.githubusercontent.com/tmhedberg/SimpylFold/master/autoload/SimpylFold.vim
set runtimepath^=~/.vim/bundle/fugitive.vim
" https://raw.githubusercontent.com/tpope/vim-fugitive/master/autoload/fugitive.vim
set runtimepath^=~/.vim/bundle/python.vim  
" https://raw.githubusercontent.com/vim-scripts/indentpython.vim/master/indent/python.vim

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=140 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


set encoding=utf-8
set number
set laststatus=2
syntax enable
filetype plugin indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=140
set expandtab
set autoindent
set tags=tags,./.git/tags,../.git/tags,../../.git/tags,../../../.git/tags,../../../../.git/tags,../../../../../.git/tags

imap <C-Right> <C-P>
