let mapleader = "\<Space>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	nvim plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Utils
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim surround
Plug 'tpope/vim-surround'
" Git wrapper for Vim
Plug 'tpope/vim-fugitive'
" NERDTree : A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
" NERDCommenter : Comment shits easily
Plug 'scrooloose/nerdcommenter'
" CTRL-P : Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'
" Emmet for vim
Plug 'mattn/emmet-vim'
" Ack for vim "
Plug 'mileszs/ack.vim'
"YCM
Plug 'Valloric/YouCompleteMe'
"Neomake
Plug 'neomake/neomake'
" BufExplorer | navigate in current buffers
Plug 'jlanzarotta/bufexplorer'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python auto complete
Plug 'davidhalter/jedi-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSX vim "
Plug 'flowtype/vim-flow'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Style
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better JSON syntax highlighting
Plug 'elzr/vim-json'
" Oceanic colorscheme
Plug 'mhartington/oceanic-next'
" Gruvbox.
Plug 'morhetz/gruvbox'
" powerbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" base16
Plug 'chriskempson/base16-vim'
" Vim lucius theme
Plug 'jonathanfilip/vim-lucius'

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
colorscheme base16-default-dark
let g:airline_theme='oceanicnext'
let g:javascript_plugin_flow = 1 "does not work in javascript.vim somehow

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
set clipboard+=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Location window + neomake keybinds
nmap <Leader>o :lopen<CR>      " open location window
nmap <Leader>c :lclose<CR>     " close location window
nmap <Leader>, :ll<CR>         " go to current error/warning

nmap <leader>s :w<cr>
nmap <leader>z :BufExplorerHorizontalSplit<cr>
" You know what this does..
map q: :q

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NERDTree with CTRL n
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

" Clear highlight on CR
:nnoremap <CR> :nohlsearch<CR><CR>

" Prevent Ack from opening first results of search
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Clean trailling white spaces
autocmd BufWritePre * %s/\s\+$//e

" Prevent CTRL-P to search in those directories
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
