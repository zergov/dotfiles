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

" Syntastic
Plugin 'scrooloose/syntastic'

" vim-jsx
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" NerdTree
Plugin 'scrooloose/nerdtree'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

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
colorscheme gruvbox
set background=dark
set t_Co=256

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
"   others
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/bash
set nocompatible
set hidden
set incsearch

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Airline powerbar auto enable
let g:airline#extensions#tabline#enabled = 1

" Make super tab use the autocomplete from the context.
let g:SuperTabDefaultCompletionType = 'context'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set paste mode to F2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NERDTree with CTRL n
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"some syntastic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
