-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- NOTE: Neo Vim native configs
require 'settings'
require 'remap'
require 'commands'

-- NOTE: Lazy installation and setup
-- It's required to setup plugins commands under this require.
require 'plugins-manager'

-- NOTE: LSP configs imports
require 'lsp-config.terraform'

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
