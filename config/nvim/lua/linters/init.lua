local M = {}

function M.setup()
  local linter_modules = {
    'linters.markdown',
  }

  for _, module_name in ipairs(linter_modules) do
    local ok, mod = pcall(require, module_name)
    if ok then
      if type(mod.setup) == 'function' then
        mod.setup()
      else
        vim.notify(("Linter module '%s' has no setup()"):format(module_name), vim.log.levels.WARN)
      end
    else
      vim.notify(("Failed to load linter module '%s'"):format(module_name), vim.log.levels.ERROR)
    end
  end
end

return M
