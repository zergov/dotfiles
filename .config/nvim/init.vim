filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" supertab
Plugin 'ervandew/supertab'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" CTRL-P for vim"
Plugin 'ctrlpvim/ctrlp.vim'

" PEP8 checking for pyhton " 
Plugin 'nvie/vim-flake8'

" Air line powerbar "
Plugin 'vim-airline/vim-airline'

"Fugitive git"
Plugin 'tpope/vim-fugitive'

" vim-surround "
Plugin 'tpope/vim-surround'

" python mode
Plugin 'klen/python-mode'

" Jedi
Plugin 'davidhalter/jedi-vim'

"Emmet 
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set termguicolors
set background=dark

set shell=/bin/bash
set hidden
set incsearch

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

" use gruvbox theme "
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Disable backup mechanism
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Tabs and indent
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
" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Airline powerbar auto enable
let g:airline#extensions#tabline#enabled = 1

" Make super tab use the autocomplete from the context.
let g:SuperTabDefaultCompletionType = 'context'

" Always show the status line
set laststatus=2

" set line numbers
set relativenumber

" Paste mode
set pastetoggle=<F2>
