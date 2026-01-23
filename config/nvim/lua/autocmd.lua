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

-- NOTE: Terraform
vim.cmd [[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]]
vim.cmd [[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]]
vim.cmd [[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]]

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
