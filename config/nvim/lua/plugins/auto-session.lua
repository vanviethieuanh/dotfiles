return {
  'rmagatti/auto-session',
  event = 'VeryLazy',
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },

      pre_save = function()
        pcall(require('neo-tree.command').execute, { action = 'close' })
      end,

      post_restore = function()
        vim.schedule(function()
          pcall(require('neo-tree.command').execute, { action = 'refresh' })
        end)
      end,
    }
  end,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    -- log_level = 'debug',
  },
}
