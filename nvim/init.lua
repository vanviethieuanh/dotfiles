-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'settings'
require 'remap'
require 'commands'
require 'plugins-manager'

-- NOTE: Terraform
vim.cmd [[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]]
vim.cmd [[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]]
vim.cmd [[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]]
vim.cmd [[let g:terraform_fmt_on_save=1]]
vim.cmd [[let g:terraform_align=1]]

-- vim.keymap('n', '<leader>ti', ':!terraform init<CR>')
-- vim.keymap('n', '<leader>tv', ':!terraform validate<CR>')
-- vim.keymap('n', '<leader>tp', ':!terraform plan<CR>')

require('lspconfig').terraformls.setup {
  -- indexing = {
  --   ignorePaths = [".terraform", "*.tfstate", "*.tfstate.*"],
  -- }
}
require('lspconfig').tflint.setup {}

-- NOTE: breadcrumbs
require('nvim-navic').setup {
  icons = {
    File = '󰈙 ',
    Module = ' ',
    Namespace = '󰌗 ',
    Package = ' ',
    Class = ' ',
    Method = '󰆧 ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = '󰕘',
    Interface = '󰕘',
    Function = '󰊕 ',
    Variable = '󰆧 ',
    Constant = '󰏿 ',
    String = '',
    Number = '󰎠 ',
    Boolean = '◩ ',
    Array = '󰅪 ',
    Object = '󰅩 ',
    Key = '󰌋 ',
    Null = '󰟢 ',
    EnumMember = ' ',
    Struct = '󰌗 ',
    Event = ' ',
    Operator = '󰆕 ',
    TypeParameter = '󰊄 ',
  },
  lsp = {
    auto_attach = true,
  },
}
require('breadcrumbs').setup {}
