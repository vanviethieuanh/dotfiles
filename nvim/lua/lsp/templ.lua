-- Register the language
vim.filetype.add {
  extension = {
    templ = 'templ',
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'templ',
  callback = function()
    vim.treesitter.start()
  end,
})
