""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Linting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neomake_typescript_tsc_maker = {
          \ 'args': ['--project', getcwd() . '/tsconfig.json', '--noEmit'],
          \ 'append_file': 0,
          \ 'errorformat':
          \   '%E%f %#(%l\,%c): error %m,' .
          \   '%E%f %#(%l\,%c): %m,' .
          \   '%Eerror %m,' .
          \   '%C%\s%\+%m'
        \ }
let g:neomake_typescript_enabled_makers = ['tsc']

autocmd! BufWritePost * Neomake

nnoremap <Leader>m :! tsc<CR>
