set ffs=unix
set encoding=utf-8
set fileencoding=utf-8
set nobackup
set nowb
set noswapfile

source ~/.config/nvim/plugins.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	  Defaults Tabs and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   look and feel
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set termguicolors
set background=dark
set relativenumber
set number
set hidden
set nocursorline
set noshowmode
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set ignorecase
set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Copy and paste
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("clipboard")
  set clipboard=unnamed " copy to system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Mappings & commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<space>"

:command Notes :e ~/notes
:command Nvimconf :e ~/.config/nvim/init.vim
:command Nvimplugins :e ~/.config/nvim/plugins.vim

" Clear highlight on CR
nnoremap <CR> :nohlsearch<CR><CR>

" Space + s to save current file
nmap <leader>s :w<cr>

" yank path of current buffer
nmap <leader>p :let @+ = expand("%")<CR>

" NERDTree remap
nnoremap <leader>nf :NERDTreeFind<CR>

" Plugin mapping
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

" resize vertical splits
nnoremap <silent> <Leader>= :exe "vertical resize +30"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -30"<CR>

autocmd BufWritePre * %s/\s\+$//e " Clean trailling white spaces on save

function BootstrapSpin()
  :PlugInstall
  :qa
endfunction()

map <leader>y :w !pbcopy <enter>

lua << EOF
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { buffer = args.buf })
    vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set('n', '<leader>lx', vim.lsp.buf.references, { buffer = args.buf })
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = args.buf })
  end,
})
EOF
