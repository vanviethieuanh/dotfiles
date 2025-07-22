return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        'bash',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'terraform',
        'yaml',
        'javascript',
        'typescript',
        'rust',
        'python',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
  },
  config = function()
    local treesitter_parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    treesitter_parser_config.templ = treesitter_parser_config.templ
      or {
        install_info = {
          url = 'https://github.com/vrischmann/tree-sitter-templ.git',
          files = { 'src/parser.c', 'src/scanner.c' },
          branch = 'master',
        },
      }

    vim.treesitter.language.register('templ', 'templ')
  end,
  'nvim-treesitter/playground',
}
