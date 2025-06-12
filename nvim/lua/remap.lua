-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: Commands
vim.keymap.set('n', '<leader>q', vim.cmd.bd, { desc = '[Q]uit current buffer' })
vim.keymap.set('n', '<leader>Q', vim.cmd.qa, { desc = '[Q]uits all buffers except those that have unsaved work' })
vim.keymap.set('n', '<leader>e', ':Neotree position=current<CR>', { desc = 'Open file [E]xplorer' })
vim.keymap.set('n', '<leader>w', vim.cmd.w, { desc = '[W]rite current buffer' })
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = '[d]iagnostic details' })
vim.keymap.set('n', '<leader>dc', function()
  local diagnostic = vim.diagnostic.get(0, { lnum = vim.fn.line '.' - 1 })[1]
  if diagnostic then
    vim.fn.setreg('+', diagnostic.message)
    print('[Diagnostic copied to clipboard]: ' .. diagnostic.message)
  else
    print 'No diagnostic on current line'
  end
end, { desc = '[d]iagnostic [c]opy to clipboard' })

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndo tree' })

vim.keymap.set('n', '<leader>F', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = 'Toggle Spectre',
})

vim.keymap.set('n', '<leader>N', function()
  vim.cmd 'enew' -- Create new unnamed buffer
  vim.bo.bufhidden = 'wipe' -- Wipe on hide
  vim.bo.buftype = '' -- Ensure normal buffer
  vim.bo.buflisted = true -- Show in buffer list
  vim.bo.filetype = 'markdown' -- Set your preferred filetype here
end, { desc = 'New unnamed buffer' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '//', function()
  local esc = vim.fn.escape
  local text = esc(vim.fn.getreg 'v', "\\/.*'$^~[]")
  vim.cmd 'normal! gv'
  vim.cmd('/\\V' .. text)
end, { noremap = true, silent = true })

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('v', '<leader>a', 'ggVG')
vim.keymap.set('n', '<leader>a', 'ggVG')

vim.keymap.set('n', '<leader>grn', function()
  local ts_utils = require 'nvim-treesitter.ts_utils'

  local bufnr = vim.api.nvim_get_current_buf()
  if vim.bo.filetype ~= 'terraform' then
    print 'Not a Terraform file'
    return
  end

  local node = ts_utils.get_node_at_cursor()
  print('Node under cursor:', node and node:type() or 'none')

  local block_type = nil

  -- Climb up the tree to find a `block` of type `resource` or `module`
  while node do
    if node:type() == 'block' then
      local first_child = node:named_child(0)
      if first_child and first_child:type() == 'identifier' then
        local ident_text = vim.treesitter.get_node_text(first_child, bufnr)
        if ident_text == 'resource' or ident_text == 'module' then
          block_type = ident_text
          break
        end
      end
    end
    node = node:parent()
  end

  if not node or not block_type then
    print 'No resource or module block found under cursor'
    return
  end

  local type_node = block_type == 'resource' and node:named_child(1) or nil
  local name_node = node:named_child(block_type == 'resource' and 2 or 1)

  if not name_node or (block_type == 'resource' and not type_node) then
    print 'Could not get block name (or type for resource)'
    return
  end

  local resource_type = type_node and vim.treesitter.get_node_text(type_node, bufnr) or 'module'
  local resource_name = vim.treesitter.get_node_text(name_node, bufnr)
  resource_name = resource_name:sub(2, -2)

  vim.ui.input({ prompt = 'New ' .. block_type .. ' name: ', default = resource_name }, function(new_name)
    if not new_name or new_name == '' or new_name == resource_name then
      return
    end

    -- Rename in buffer
    local srow, scol, erow, ecol = name_node:range()
    vim.api.nvim_buf_set_text(bufnr, srow, scol, erow, ecol, { '"' .. new_name .. '"' })
    print('Renamed ' .. resource_type .. '.' .. resource_name .. ' to ' .. new_name)

    -- Generate moved block
    local from = block_type == 'resource' and (resource_type .. '.' .. resource_name) or ('module.' .. resource_name)

    local to = block_type == 'resource' and (resource_type .. '.' .. new_name) or ('module.' .. new_name)

    local moved_block = string.format(
      [[
moved {
  from = %s
  to   = %s
}
]],
      from,
      to
    )
    -- Append moved block to moved.tf
    local moved_path = vim.fn.expand '%:p:h' .. '/moved.tf'
    local f = io.open(moved_path, 'a+')
    if f then
      f:write('\n' .. moved_block)
      f:close()
      print 'Updated moved.tf'
    else
      print 'Failed to open moved.tf'
    end
  end)
end, { desc = 'Rename Terraform resource or module with moved block' })
