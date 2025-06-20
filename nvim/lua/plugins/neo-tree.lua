return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    { '3rd/image.nvim', opts = {} }, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    filesystem = {
      filtered_items = {
        bind_to_cwd = true, -- ensures Neo-tree follows Neovim's cwd
        follow_current_file = {
          enabled = true, -- updates root to the file in the current buffer
        },
        hijack_netrw_behavior = 'open_current', -- or "open_default" depending on your setup
        visible = true,
      },
    },
  },
}
