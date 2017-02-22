""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Colorscheme for Python files.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
" colorscheme hemisu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Tabs and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set cursorline
set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Set a marker at column 79 (PEP8)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=79
highlight ColorColumn guibg=grey

" Don't load youcomplete me
let g:loaded_youcompleteme = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Jedi configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal completeopt-=preview

let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
