vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.lsp.start({
  name = 'clangd',
  cmd = {'clangd'},
  root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
})
