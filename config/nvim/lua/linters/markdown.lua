local M = {}

function M.setup()
  local lint = require 'lint'

  -- Register filetypes if needed
  lint.linters_by_ft.markdown = { 'markdownlint' }

  -- Safely extend args
  local ml = lint.linters.markdownlint
  if not ml then
    vim.notify('markdownlint linter not found', vim.log.levels.WARN)
    return
  end

  ml.args = vim.list_extend(ml.args or {}, {
    '--disable',
    'MD013', -- long lines
  })
end

return M
