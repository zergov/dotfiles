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
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

" Emmet for vim
Plug 'mattn/emmet-vim'
"Neomake
Plug 'neomake/neomake'
" supertab
Plug 'ervandew/supertab'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python auto complete
Plug 'davidhalter/jedi-vim'
Plug 'Vimjas/vim-python-pep8-indent'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Ruby
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Style
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better JSON syntax highlighting
Plug 'elzr/vim-json'
" Gruvbox.
Plug 'morhetz/gruvbox'
" powerbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ack plugin
Plug 'mileszs/ack.vim'

" Buffer navigator
Plug 'jeetsukumaran/vim-buffergator'

call plug#end()
