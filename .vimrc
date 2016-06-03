set nocompatible              " be iMproved, required
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
"
"
"

set termguicolors
set shell=/bin/bash
let g:python_host_skip_check = 1

set nocompatible
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

" pls "
set background=dark
set t_Co=256

" use ondedark theme "
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	BackUp and shits
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
"   python 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
"set omnifunc=jedi#completions

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Pymode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_folding = 0
let g:pymode_lint = 1
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_syntax_all = 1
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_trim_whitespaces = 1
set completeopt=menu,preview
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


" Delete trailing white space on save
" func! DeleteTrailingWS()
"  exe "normal mz"
"    %s/\s\+$//ge
"      exe "normal `z"
"      endfunc
"      autocmd BufWrite *.js :call DeleteTrailingWS()
"      autocmd BufWrite *.html :call DeleteTrailingWS()

"autocmd BufWrite *.py :call DeleteTrailingWS()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	set line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber

set pastetoggle=<F2>

" Run nosetests
map <F4> :! nosetests <CR>
