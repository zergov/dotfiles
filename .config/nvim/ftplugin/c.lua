vim.lsp.start({
  name = 'clangd',
  cmd = {'clangd'},
  root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
})
