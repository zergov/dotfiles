let mapleader = "\<space>"

source ~/.config/nvim/plugins.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Color and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" disable mode informations (since im using lightline)
set noshowmode

" Use Unix line ending
set ffs=unix,dos,mac

" Use UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8  " The encoding written to file.

" colorscheme "
set termguicolors
set background=dark
colorscheme zenburn
set nocursorline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	BackUp and shits
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Defaults Tabs and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   others
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber
set number
set hidden

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set ignorecase
set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Copy and paste
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear highlight on CR
nnoremap <CR> :nohlsearch<CR><CR>

" Space + s to save current file
nmap <leader>s :w<cr>

" Plugin mapping
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

" resize vertical splits
nnoremap <silent> <Leader>= :exe "vertical resize +30"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -30"<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clean trailling white spaces
autocmd BufWritePre * %s/\s\+$//e

" run neomake on save, and on changes
call neomake#configure#automake('w')

" 256 colors <3
let &t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :Findnotes    - search for keywords in my personal notes
:command -nargs=+ Findnotes :Ack! "<args>" ~/notes<Space>
