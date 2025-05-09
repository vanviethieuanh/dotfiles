return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
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
                i = 'green',
                v = 'blue',
                [''] = 'blue',
                V = 'blue',
                c = 'magenta',
                no = 'red',
                s = 'orange',
                S = 'orange',
                [''] = 'orange',
                ic = 'yellow',
                R = 'violet',
                Rv = 'violet',
                cv = 'red',
                ce = 'red',
                r = 'cyan',
                rm = 'cyan',
                ['r?'] = 'cyan',
                ['!'] = 'red',
                t = 'red',
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
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
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
