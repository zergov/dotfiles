call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'   " surrrrrrrrrrrrrrrrrrrroundingssssssssssss
Plug 'tpope/vim-fugitive'   " Git wrapper
Plug 'tpope/vim-rhubarb'    " enable GBrowse for github repositories

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

" NERDCommenter : Comment shits easily
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1   " Use compact syntax for prettified multi-line comments

" FZF : Fuzzy file, buffer, mru, tag, etc finder.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_COMMAND = 'rg --files --glob="!*.rbi"'
nnoremap <c-p> :FZF<cr>

" Press tab to navigate omni
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Ack on vim
Plug 'mileszs/ack.vim'
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case' " Trying ack with ripgrep now
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Deoplete
" if has('nvim')
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1

Plug 'jeetsukumaran/vim-buffergator'  " buffer explorer
Plug 'itchyny/lightline.vim'          " cool status bar

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'keith/parsec.vim'
Plug 'jnurmine/Zenburn'
Plug 'AlessandroYorba/Alduin'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
      \ 'ruby': ['bundle', 'exec', 'srb', 'tc', '--lsp'],
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ 'typescriptreact': ['typescript-language-server', '--stdio'],
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Typescript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Javascript & JSX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	HTML5
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Ruby
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-ruby/vim-ruby'
Plug 'Shopify/vim-sorbet', { 'branch': 'main' } " Turns sorbet signatures to comment colorscheme

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Elixir
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'elixir-editors/vim-elixir'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Graphql
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jparise/vim-graphql'

call plug#end()
