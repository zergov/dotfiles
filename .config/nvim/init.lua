vim.cmd("source ~/.config/nvim/plugins.vim")

vim.o.ffs= "unix"
vim.o.encoding= "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

--------------------------------------------------------------
--	  Defaults Tabs and indent
--------------------------------------------------------------
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autoindent = true
vim.o.wrap = false

------------------------------------------------------------
--   look and feel
------------------------------------------------------------
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.relativenumber = true
vim.o.number = true
vim.o.hidden = true
vim.o.cursorline = false
vim.o.showmode = false
vim.cmd.colorscheme("gruvbox")

------------------------------------------------------------
--   Search
------------------------------------------------------------
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

------------------------------------------------------------
--   LSP keybinds
------------------------------------------------------------
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { buffer = args.buf })
    vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set('n', '<leader>lx', vim.lsp.buf.references, { buffer = args.buf })
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = args.buf })
  end,
})

vim.cmd([[
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
EOF
]])
