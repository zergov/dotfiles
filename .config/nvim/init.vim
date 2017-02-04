""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	nvim plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" CTRL-P : Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'

" Gruvbox.
Plug 'morhetz/gruvbox'

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

" Vim syntastic: Syntax checking hacks for vim
Plug 'vim-syntastic/syntastic'

" Emmet for vim
Plug 'mattn/emmet-vim'

" JSX vim "
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Base16 colorscheme "
Plug 'chriskempson/base16-vim'

" Ack for vim "
Plug 'mileszs/ack.vim'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" Tern for vim
Plug 'ternjs/tern_for_vim'

" Supertab!
Plug 'ervandew/supertab'


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
colorscheme gruvbox
set termguicolors
set background=dark

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
"   Copy and paste to clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard+=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NERDTree with CTRL n
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

" Clear highlight on CR
:nnoremap <CR> :nohlsearch<CR><CR>

" Prevent Ack from opening first results of search
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Prevent CTRL-P to search in those directories
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Disable YCM  ( we're using jedi )
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'python': 1
      \}

" Supertab scroll from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"
