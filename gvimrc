" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=Courier|12
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=light              " Background.
set lines=50 columns=85          " Window dimensions.

set guioptions-=r                 " Don't show right scrollbar

set number

colorscheme vividchalk

filetype indent on

set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab
