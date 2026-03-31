return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'bash',
        'diff',
        'javascript',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'rust',
        'templ',
        'terraform',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
        'wgsl-bevy',
      },
      auto_install = false,
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
  { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
}
