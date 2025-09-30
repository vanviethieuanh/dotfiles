return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function get_fg(group)
      local hl = vim.api.nvim_get_hl(0, { name = group })
      return hl and hl.fg and string.format('#%06x', hl.fg)
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        component_separator = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 10000,
          winbar = 10000,
        },
      },

      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return '▊ ' .. str:sub(1, 1)
            end,
            color = function()
              -- auto change color according to neovims mode
              local mode_color = {
                n = 'fg',
                i = get_fg 'green',
                v = get_fg 'blue',
                [''] = get_fg 'blue',
                V = get_fg 'blue',
                c = get_fg 'yellow',
                no = get_fg 'red',
                s = get_fg 'orange',
                S = get_fg 'orange',
                [''] = get_fg 'orange',
                ic = get_fg 'yellow',
                R = get_fg 'violet',
                Rv = get_fg 'violet',
                cv = get_fg 'red',
                ce = get_fg 'red',
                r = get_fg 'cyan',
                rm = get_fg 'cyan',
                ['r?'] = get_fg 'cyan',
                ['!'] = get_fg 'red',
                t = get_fg 'red',
              }
              return { fg = mode_color[vim.fn.mode()], bg = 'bg' }
            end,
          },
        },
        lualine_b = {
          {
            'branch',
            icon = '󰊢',
            color = { fg = 'fg', bg = 'bg' },
          },
          { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
          },
        },
        lualine_c = {
          {
            'filename',
            path = 1,
            file_status = true,
          },
        },
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
          {
            require('noice').api.statusline.mode.get,
            cond = require('noice').api.statusline.mode.has,
            color = { fg = '#ff9e64' },
          },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
