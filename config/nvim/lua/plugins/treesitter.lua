return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup {}

      require('nvim-treesitter').install {
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
      }

      vim.treesitter.language.register('templ', 'templ')
    end,
  },
}
