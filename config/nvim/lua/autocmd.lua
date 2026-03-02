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

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = vim.api.nvim_create_augroup('systemd_ftdetect', { clear = true }),
  desc = 'Set filetype for systemd unit files',
  pattern = {
    '*.service',
    '*.mount',
    '*.socket',
    '*.timer',
  },
  callback = function()
    vim.cmd 'set filetype=systemd'
  end,
})

vim.o.title = true

-- NOTE: Terraform
vim.cmd [[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]]
vim.cmd [[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]]
vim.cmd [[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]]
