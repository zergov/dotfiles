vim.cmd("source ~/.config/nvim/plugins.vim")

vim.g.mapleader = ' '

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
vim.cmd("silent! colorscheme gruvbox")

------------------------------------------------------------
--   Search
------------------------------------------------------------
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

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
vim.keymap.set('',    '<leader>y',        ':w !pbcopy <CR>', { noremap = false})
vim.keymap.set('n',   '<CR>',             ':nohlsearch<CR><CR>', { noremap = true }) -- Clear highlight on CR
vim.keymap.set('n',   '<leader>s',        ':w<CR>', { noremap = false})
vim.keymap.set('n',   '<leader>p',        ':let @+ = expand("%")<CR>', { noremap = false}) -- yank path of current buffer
vim.keymap.set('n',   '<leader>nf',       ':NERDTreeFind<CR>', { noremap = false}) -- focus current buffer's file in NERDTree
vim.keymap.set('n',   '<leader>f',        ':Ack! ', { noremap = false})
vim.keymap.set('n',   '<leader>=',        ':exe "vertical resize +30"<CR>', { noremap = false})
vim.keymap.set('n',   '<leader>-',        ':exe "vertical resize -30"<CR>', { noremap = false})

------------------------------------------------------------
--   LSP
------------------------------------------------------------
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}
-- lspconfig.ruby_lsp.setup{
  -- init_options = {
    -- formatter = 'standard',
    -- linters = { 'standard' },
  -- }
-- }

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil

    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { buffer = args.buf })
    vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set('n', '<leader>lx', vim.lsp.buf.references, { buffer = args.buf })
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = args.buf })
  end,
})

------------------------------------------------------------
--   other stuff
------------------------------------------------------------
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
