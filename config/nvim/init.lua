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
require 'autocmd'

-- NOTE: Lazy installation and setup
-- It's required to setup plugins commands under this require.
require 'plugins-manager'

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.schedule(function()
      require('linters').setup()
      require('nvim-highlight-colors').turnOn()
    end)
  end,
})

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
