local M = {}

function M.copy_line()
  local d = vim.diagnostic.get(0, { lnum = vim.fn.line '.' - 1 })[1]
  if d then
    vim.fn.setreg('+', d.message)
    print('[Diagnostic copied]: ' .. d.message)
  else
    print 'No diagnostic on this line'
  end
end

function M.copy_all()
  local diags = vim.diagnostic.get(0)
  local msgs = {}
  for _, d in ipairs(diags) do
    table.insert(msgs, string.format('%s:%d:%d: %s', vim.api.nvim_buf_get_name(0), d.lnum + 1, d.col + 1, d.message))
  end
  vim.fn.setreg('+', table.concat(msgs, '\n'))
  print('Copied ' .. #msgs .. ' diagnostics')
end

return M
