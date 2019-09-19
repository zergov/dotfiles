" Vim surround
Plug 'tpope/vim-surround'

" Git wrapper for Vim
Plug 'tpope/vim-fugitive'

" NERDTree : A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

" NERDCommenter : Comment shits easily
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" FZF : Fuzzy file, buffer, mru, tag, etc finder.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <c-p> :FZF<cr>

" Emmet for vim
Plug 'mattn/emmet-vim'

"Neomake
Plug 'neomake/neomake'

" gruvbox
Plug 'morhetz/gruvbox'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" supertab
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" buffer explorer
Plug 'jeetsukumaran/vim-buffergator'

" ack on vim
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'  " Install https://github.com/ggreer/the_silver_searcher, it's fast yo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Typescript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/denite.nvim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'davidhalter/jedi-vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'zchee/deoplete-jedi'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Javascript & JSX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	PHP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'StanAngeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	HTML5
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'othree/html5.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Ruby
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Elixir
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'elixir-editors/vim-elixir'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
