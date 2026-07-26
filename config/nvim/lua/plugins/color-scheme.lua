local color_scheme = 'neanias/everforest-nvim'

return {
  color_scheme,
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    require('everforest').setup({
      background = 'hard',
    })

    vim.cmd.colorscheme 'everforest'
  end,
}
