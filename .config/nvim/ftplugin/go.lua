--------------------------------------------------------------
--	  Defaults Tabs and indent
--------------------------------------------------------------
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.wrap = false

vim.lsp.start({
  name = 'gopls',
  cmd = {'gopls'},
  root_dir = vim.fs.dirname(vim.fs.find({'go.mod'}, { upward = true })[1])
})
