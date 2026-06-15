vim.api.nvim_create_autocmd({ 'VimEnter', 'DirChanged' }, {
  callback = function()
    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    vim.cmd('let &titlestring = "' .. cwd .. '"')
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.wo.colorcolumn = '80'
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = vim.api.nvim_create_augroup('systemd_ftdetect', { clear = true }),
  desc = 'Set filetype for systemd unit files',
  pattern = {
    '*.service',
    '*.mount',
    '*.socket',
    '*.timer',
  },
  callback = function()
    vim.cmd 'set filetype=systemd'
  end,
})

vim.o.title = true

vim.filetype.add {
  extension = {
    hcl = 'hcl',
    tf = 'terraform',
    tfvars = 'terraform',
    tfstate = 'json',
    templ = 'templ',

    service = 'systemd',
    socket = 'systemd',
    timer = 'systemd',
    mount = 'systemd',
    automount = 'systemd',
    swap = 'systemd',
    target = 'systemd',
    path = 'systemd',
    slice = 'systemd',
    scope = 'systemd',
    device = 'systemd',
  },
  filename = {
    ['.terraformrc'] = 'hcl',
    ['terraform.rc'] = 'hcl',
  },
  pattern = {
    ['.*%.tfstate%.backup'] = 'json',
  },
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
