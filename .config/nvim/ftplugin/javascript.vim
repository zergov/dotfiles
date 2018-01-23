""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Colorscheme for Javascripts files.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid

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

let g:NERDCustomDelimiters = { 'javascript': { 'left': '/**','right': '*/' } }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Linting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint' ]
autocmd! BufWritePost * Neomake
" Disable flow on save since we're using neomake
let g:flow#enable = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run jest tests
nnoremap <Leader>r :! ./node_modules/jest/bin/jest.js<CR>
nnoremap <Leader>g :FlowJumpToDef<CR>
