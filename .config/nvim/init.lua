vim.g.mapleader = ' '

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

------------------------------------------------------------
--   Clipboard
------------------------------------------------------------
if vim.fn.has('clipboard') then
  vim.o.clipboard = 'unnamed' -- copy to system clipboard
  if vim.fn.has('unnamedplus') then -- X11 support
    vim.o.clipboard = 'unnamedplus'
  end
end

------------------------------------------------------------
--   Mappings
------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<CR>', ':nohlsearch<CR><CR>', { noremap = true }) -- Clear highlight on CR
vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', { noremap = false})
vim.api.nvim_set_keymap('n', '<leader>p', ':let @+ = expand("%")<CR>', { noremap = false}) -- yank path of current buffer
vim.api.nvim_set_keymap('n', '<leader>nf', ':NERDTreeFind<CR>', { noremap = false}) -- focus current buffer's file in NERDTree
vim.api.nvim_set_keymap('n', '<leader>f', ':Ack! ', { noremap = false})
vim.api.nvim_set_keymap('n', '<leader>=', ':exe "vertical resize +30"<CR>', { noremap = false})
vim.api.nvim_set_keymap('n', '<leader>-', ':exe "vertical resize -30"<CR>', { noremap = false})
vim.api.nvim_set_keymap('n', '<leader>-', ':exe "vertical resize -30"<CR>', { noremap = false})
vim.api.nvim_set_keymap('', '<leader>y', ':w !pbcopy <CR>', { noremap = false})

function _G.install_plugins()
  vim.cmd(':PlugInstall')
  vim.cmd(':qa')
end

-- autocmd BufWritePre * %s/\s\+$//e " Clean trailling white spaces on save
