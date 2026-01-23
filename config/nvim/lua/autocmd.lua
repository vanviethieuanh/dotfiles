vim.api.nvim_create_autocmd({ 'VimEnter', 'DirChanged' }, {
  callback = function()
    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    vim.cmd('let &titlestring = "' .. cwd .. '"')
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.wo.colorcolumn = '80'
  end,
})

vim.o.title = true

vim.filetype.add {
  extension = {
    hcl = 'hcl',
    tf = 'terraform',
    tfvars = 'terraform',
    tfstate = 'json',
    templ = 'templ',
  },
  filename = {
    ['.terraformrc'] = 'hcl',
    ['terraform.rc'] = 'hcl',
  },
  pattern = {
    ['.*%.tfstate%.backup'] = 'json',
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'templ',
  callback = function()
    vim.treesitter.start()
  end,
})
