local color_scheme = 'gruvbox-material'
local color_name = color_scheme:match '[^/]+$'

return {
  color_scheme,
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.gruvbox_material_background = 'hard'
    vim.cmd.colorscheme(color_name)
  end,
}
