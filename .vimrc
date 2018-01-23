let mapleader = "\<space>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	nvim plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim
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
set clipboard=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear highlight on CR
:nnoremap <CR> :nohlsearch<CR><CR>

" Open NERDTree with CTRL n
map <C-n> :NERDTreeToggle<CR>

" Space + s to save current file
nmap <leader>s :w<cr>

" You know what this does..
map q: :q

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
