local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local mappings = {
  -- NOTE: Normal mode
  n = {
    { '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' } },
    { '<leader>q', ':b#<bar>bd#<CR>', { desc = '[Q]uit buffer' } },
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
    {
      '<leader>T',
      ':set filetype=',
      { desc = 'Prompt to select file [T]ype' },
    },

    -- Window rearrangement
    { '<C-S-h>', '<C-w>H', { desc = 'Move window to far left' } },
    { '<C-S-j>', '<C-w>J', { desc = 'Move window to far bottom' } },
    { '<C-S-k>', '<C-w>K', { desc = 'Move window to far top' } },
    { '<C-S-l>', '<C-w>L', { desc = 'Move window to far right' } },

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

    -- Swap jumplist navigation
    { '<C-o>', '<C-i>', { desc = 'Jump forward (swapped)' } },
    { '<C-i>', '<C-o>', { desc = 'Jump back (swapped)' } },
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
