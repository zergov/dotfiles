""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Set a marker at column 79 (PEP8)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=79
highlight ColorColumn guibg=grey
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Linting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:neomake_python_enabled_makers = ['flake8']
autocmd! BufWritePost * Neomake

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
