""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Colorscheme for Javascripts files.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Tabs and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set expandtab
"set tabstop=8
"set shiftwidth=4
"set softtabstop=4
"set autoindent
"set cursorline
"set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Set a marker at column 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=130
highlight ColorColumn guibg=grey

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Always use the JSX syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Syntastics options (eslint)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']

" Override eslint with local version where necessary.
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif

let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
