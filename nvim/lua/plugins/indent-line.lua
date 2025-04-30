return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = { char = '▏' },
    exclude = { filetypes = { 'terminal', 'dashboard' } },
  },
}
