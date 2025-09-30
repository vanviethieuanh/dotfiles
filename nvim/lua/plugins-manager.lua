-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: symbols path
  'mbbill/undotree',
  'dstein64/vim-startuptime',
  'arthurxavierx/vim-caser',
  'hashivim/vim-terraform',
  'nvim-pack/nvim-spectre',

  require 'lsp-config', -- MAIN LSP config plugin
  require 'plugins.auto-session', -- Session manager
  require 'plugins.bigfile',
  require 'plugins.blinks', -- Autocompletion
  require 'plugins.color-scheme', -- Color Scheme
  require 'plugins.conform', -- Formatter
  require 'plugins.dashboard-nvim', -- Greeting screen
  require 'plugins.git', -- Git related configurations
  --  require 'plugins.harpoon',
  require 'plugins.indent-line',
  require 'plugins.lazy-dev', -- LSP for NeoVim Config
  require 'plugins.lint', -- Linter
  require 'plugins.lua-snip',
  require 'plugins.lualine',
  require 'plugins.mini', -- Mini tools
  require 'plugins.navic',
  require 'plugins.neo-tree', -- Dir tree
  require 'plugins.noice',
  require 'plugins.suda',
  require 'plugins.telescope', -- Search
  require 'plugins.todo-comments', -- This highlight todo and notes.
  require 'plugins.treesitter', -- This create a tree for other plugins
  require 'plugins.which-key', -- Show shortcuts on pressing

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.autopairs',

  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}
