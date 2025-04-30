-- NOTE: Session manager
return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    local auto_session = require 'auto-session'
    local auto_session_lens = require 'auto-session.session-lens'

    auto_session.setup {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    }

    vim.keymap.set('n', '<leader>ls', auto_session_lens.search_session, { desc = '[l]ist all [s]essions.' })
  end,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    -- log_level = 'debug',
  },
}
