local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local mappings = {
  -- NOTE: Normal mode
  n = {
    { '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' } },
    { '<leader>q', vim.cmd.bd, { desc = '[Q]uit buffer' } },
    { '<leader>Q', vim.cmd.qa, { desc = 'Quit all buffers' } },
    { '<leader>w', vim.cmd.w, { desc = '[W]rite buffer' } },
    { '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle undo tree' } },
    { '<leader>F', '<cmd>lua require("spectre").toggle()<CR>', { desc = 'Toggle Spectre' } },
    {
      '<leader>N',
      function()
        vim.cmd 'enew'
        vim.bo.bufhidden, vim.bo.buftype, vim.bo.buflisted, vim.bo.filetype = 'wipe', '', true, 'markdown'
      end,
      { desc = 'New unnamed buffer' },
    },
    { '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' } },
    { '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' } },
    { '<C-j>', '<C-w><C-j>', { desc = 'Move to lower window' } },
    { '<C-k>', '<C-w><C-k>', { desc = 'Move to upper window' } },
    { 'n', 'nzzzv' },
    { 'N', 'Nzzzv' },
    { '<leader>a', 'ggVG' },
    {
      '<leader>z',
      function()
        vim.wo.wrap = not vim.wo.wrap
        vim.wo.linebreak = vim.wo.wrap
        print(vim.wo.wrap and '[wrap ON]' or '[wrap OFF]')
      end,
      { desc = 'Toggle wrap' },
    },

    {
      '<leader>e',
      function()
        if vim.fn.bufname() ~= '' then
          -- Open Neo-tree in the current window, revealing current file
          vim.cmd 'Neotree reveal current'
        else
          -- Fallback: toggle sidebar (default)
          vim.cmd 'Neotree toggle'
        end
      end,
      { desc = 'Open file [E]xplorer' },
    },

    { '<leader>dd', vim.diagnostic.open_float, { desc = 'Diagnostic float' } },
    { '<leader>dc', require('utils.actions.diagnostic').copy_line, { desc = 'Copy diagnostic' } },
    { '<leader>dC', require('utils.actions.diagnostic').copy_all, { desc = 'Copy all diagnostics' } },
  },
  -- NOTE: Visual mode
  v = {
    { 'J', ":m '>+1<CR>gv=gv" },
    { 'K', ":m '<-2<CR>gv=gv" },
    { '>', '>gv' },
    { '<', '<gv' },
    { '<leader>a', 'ggVG' },
    {
      '//',
      function()
        local esc = vim.fn.escape
        local text = esc(vim.fn.getreg 'v', "\\/.*'$^~[]")
        vim.cmd 'normal! gv'
        vim.cmd('/\\V' .. text)
      end,
    },
  },
  -- NOTE: Terminal mode
  t = {
    { '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' } },
  },
}

for mode, maps in pairs(mappings) do
  for _, m in ipairs(maps) do
    map(mode, m[1], m[2], vim.tbl_extend('force', opts, m[3] or {}))
  end
end
