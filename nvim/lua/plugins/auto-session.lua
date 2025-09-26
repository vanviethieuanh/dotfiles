-- NOTE: Session manager
return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    }
  end,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    -- log_level = 'debug',
  },
}
