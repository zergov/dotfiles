""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Colorscheme for Python files.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
syntax on
colorscheme hemisu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Tabs and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set autoindent
set cursorline
set nowrap

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
