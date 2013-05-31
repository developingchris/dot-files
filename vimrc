filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set runtimepath^=~/.vim/bundle/ctrlp.vim

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

let mapleader = ","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

command! W :w

nmap <leader>w <C-w><C-w>
nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <leader>f :CtrlP<CR>
nmap <silent> <leader>r :w<CR>:!ruby %<CR>
"nmap <silent> <leader>r :w<CR>:!rake<CR>
"nmap <silent> <leader>r :w<CR>:Rake<CR>
"nmap <silent> <leader>cs :w<CR>!gcs %<CR>

let g:ctrlp_prompt_mappings = { 'AcceptSelection("v")': ['<c-s>', '<RightMouse>'], 'AcceptSelection("h")': ['<c-x>', '<c-cr>' ]}
"imap jk <Esc>

"set guifont=monaco:h16
"set guifont=Menlo\ Regular:h16
set guifont=Inconsolata:h18


set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " And again.

set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk
colorscheme vividchalk


" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
