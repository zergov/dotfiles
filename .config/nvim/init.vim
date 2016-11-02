call plug#begin('~/.config/nvim/plugged')

" CTRL-P : Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'

" Vim surround
Plug 'tpope/vim-surround'

" Git wrapper for Vim
Plug 'tpope/vim-fugitive'

" NERDTree : A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" NERDCommenter : Comment shits easily
Plug 'scrooloose/nerdcommenter'

" Vim airline
Plug 'vim-airline/vim-airline'

" Python auto complete
Plug 'davidhalter/jedi-vim'

" Vim motion
Plug 'easymotion/vim-easymotion'

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
colorscheme monokai
set termguicolors

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
set tabstop=8
set shiftwidth=4
set softtabstop=4
set autoindent
set cursorline
set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   others
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set shell=/bin/bash
set hidden
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NERDTree with CTRL n
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

