call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'   " surrrrrrrrrrrrrrrrrrrroundingssssssssssss
Plug 'tpope/vim-fugitive'   " Git wrapper
Plug 'tpope/vim-rhubarb'    " enable GBrowse for github repositories

Plug 'neovim/nvim-lspconfig'

Plug 'scrooloose/nerdtree'  " A tree explorer plugin for vim.
map <C-n> :NERDTreeToggle<CR>

Plug 'scrooloose/nerdcommenter' " NERDCommenter : Comment shits easily
let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1   " Use compact syntax for prettified multi-line comments

" FZF : Fuzzy file, buffer, mru, tag, etc finder.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_COMMAND = 'rg --files --glob="!*.rbi"'
nnoremap <c-p> :FZF<cr>

Plug 'mileszs/ack.vim' " Ack bindings for vim
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case' " Trying ack with ripgrep now
let g:ack_use_cword_for_empty_search = 1 " Any empty ack search will search for the work the cursor is on

Plug 'jeetsukumaran/vim-buffergator'  " buffer explorer
Plug 'itchyny/lightline.vim'          " cool status bar
Plug 'morhetz/gruvbox'                " colorscheme

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	JS / Typescript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	HTML
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Ruby
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-ruby/vim-ruby'
Plug 'Shopify/vim-sorbet', { 'branch': 'main' } " Turns sorbet signatures to comment colorscheme

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Graphql
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jparise/vim-graphql'

call plug#end()
