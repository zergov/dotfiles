""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Colorscheme for Javascripts files.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
colorscheme Tomorrow-Night

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Tabs and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set cursorline
set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Set a marker at column
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=130
highlight ColorColumn guibg=grey

"	Always use the JSX syntax highlighting
let g:jsx_ext_required = 1
" flow
let g:flow#autoclose = 1
let g:flow#enable = 1

let g:NERDCustomDelimiters = { 'javascript': { 'left': '/**','right': '*/' } }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Linting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
autocmd! BufWritePost * Neomake

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run jest tests
nnoremap <Leader>r :! ./node_modules/jest/bin/jest.js<CR>
