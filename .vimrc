set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

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
"set background=dark

set t_Co=256

" use ondedark theme "
colorscheme Tomorrow-Night


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
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_syntax_all = 1
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_rope_goto_definition_cmd = 'e'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   others
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline powerbar auto enable
let g:airline#extensions#tabline#enabled = 1


" Delete trailing white space on save
 func! DeleteTrailingWS()
   exe "normal mz"
     %s/\s\+$//ge
       exe "normal `z"
       endfunc
       autocmd BufWrite *.py :call DeleteTrailingWS()
       autocmd BufWrite *.js :call DeleteTrailingWS()
       autocmd BufWrite *.html :call DeleteTrailingWS()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	set line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number

map <F4> :! nosetests <CR>
map <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

