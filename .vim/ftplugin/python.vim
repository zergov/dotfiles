
let python_highlight_all = 1
let g:python_host_skip_check = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Pymode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_folding = 0
let g:pymode_lint = 1
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_syntax_all = 1
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_trim_whitespaces = 1
set completeopt=menu,preview

" Run nosetests
map <F4> :! nosetests <CR>
