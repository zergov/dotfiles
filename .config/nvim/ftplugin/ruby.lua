vim.lsp.start({
  name = 'sorbet-lsp',
  cmd = {'bundle', 'exec', 'srb', 'tc', '--lsp'},
  root_dir = vim.fs.dirname(vim.fs.find({'Gemfile'}, { upward = true })[1]),
})
