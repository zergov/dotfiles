let mapleader = "\<space>"

call plug#begin('~/.config/nvim/plugged')
source ~/.config/nvim/plugins.vim
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Color and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Use Unix line ending
set ffs=unix,dos,mac

" Use UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8  " The encoding written to file.

" colorscheme "
set termguicolors
set background=dark
colorscheme gruvbox
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   others
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber
set number
set hidden

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

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
nnoremap <Leader>F :Ack!<Space>
nnoremap <c-p> :FZF<cr>
cnoreabbrev Ack Ack!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clean trailling white spaces
autocmd BufWritePre * %s/\s\+$//e

" run neomake on save, and on changes
call neomake#configure#automake('w')

" 256 colors <3
let &t_Co=256
