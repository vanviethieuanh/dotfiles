require('lazy').setup {
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },
  { 'arthurxavierx/vim-caser', keys = { 'gsp', 'gsc', 'gsm', 'gss', 'gsu', 'gst', 'gsK' } },
  { 'hashivim/vim-terraform', ft = { 'terraform', 'tf', 'hcl' } },
  { 'nvim-pack/nvim-spectre', cmd = { 'Spectre' }, keys = { { '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', desc = 'Toggle Spectre' } } },

  require 'lsp-config', -- MAIN LSP config plugin

  require 'plugins.highlight-color',

  require 'plugins.snacks',
  require 'plugins.auto-session', -- Session manager
  require 'plugins.bigfile',
  require 'plugins.blinks', -- Autocompletion
  require 'plugins.color-scheme', -- Color Scheme
  require 'plugins.conform', -- Formatter
  require 'plugins.git', -- Git related configurations
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
