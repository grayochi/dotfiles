return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = 'windwp/nvim-ts-autotag',
  config = function()
    local treesitter = require('nvim-treesitter.configs')

    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        eable = true,
      },
      ensure_installed = {
        'lua',
        'javascript',
        'typescript',
        'tsx',
        'vue',
        'svelte',
        'go',
        'python',
        'rust',
        'regex',
        'terraform',
        'graphql',
        'sql',
        'html',
        'css',
        'json',
        'json5',
        'dockerfile',
        'make',
        'markdown',
        'vim',
        'vimdoc',
        'bash',
        'gitcommit',
        'git_config',
        'gitignore',
        'tmux',
        'xml',
        'yaml',
        'ssh_config',
        'query',
      },
      incremental_selection = {
        init_selection = '<C-SPACE>',
        node_selection = '<C-SPACE>',
        scope_selection = false,
        node_decremental = '<BS>',
      }
    })
  end,
}
