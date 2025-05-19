vim.api.nvim_create_autocmd({ 'VimEnter', 'DirChanged' }, {
  callback = function()
    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    vim.cmd('let &titlestring = "' .. cwd .. '"')
  end,
})

vim.o.title = true
