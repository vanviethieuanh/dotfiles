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

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
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
