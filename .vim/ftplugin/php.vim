""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Linting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neomake_python_enabled_makers = ['php']
autocmd! BufWritePost * Neomake
