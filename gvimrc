" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

" set guifont=Courier|12
set gfn=Monaco|12
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=light              " Background.
set lines=44 columns=150          " Window dimensions.

set guioptions-=r                 " Don't show right scrollbar

set number


filetype plugin indent on

set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab

" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

colorscheme vividchalk
