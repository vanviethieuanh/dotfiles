return {
  'L3MON4D3/LuaSnip',
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    -- Load vscode-style snippets (optional, gives you many defaults)
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Load your Lua snippets from lua/snippets/
    require('luasnip.loaders.from_lua').lazy_load {
      paths = { vim.fn.stdpath 'config' .. '/lua/snippets' },
    }
  end,
}
