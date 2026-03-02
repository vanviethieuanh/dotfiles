return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',

  cmd = 'Neotree', -- load only when command is used
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Explorer' },
  },

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',

    {
      '3rd/image.nvim',
      optional = true,
      opts = {},
    },
  },

  opts = {
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = 'open_current',
      filtered_items = { visible = true },
    },

    event_handlers = {
      {
        event = 'neo_tree_window_after_open',
        handler = function(args)
          vim.wo[args.winid].colorcolumn = ''
          vim.wo[args.winid].signcolumn = 'no'
        end,
      },
    },
  },
}
