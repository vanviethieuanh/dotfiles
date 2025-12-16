local M = {}

function M.setup()
  -- Order matters only if linters share filetypes
  local linters = {
    'linters.markdown',
  }

  for _, linter in ipairs(linters) do
    local ok, mod = pcall(require, linter)
    if ok and type(mod.setup) == 'function' then
      mod.setup()
    end
  end
end

return M
