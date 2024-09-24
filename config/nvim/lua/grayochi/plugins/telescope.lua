return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '-u',
        },
        file_ignore_patterns = { '^node_modules/*', '^.git/', '^.yarn/' },
        mappings = {
          n = {
            ['t'] = actions.select_tab,
            ['v'] = actions.select_vertical,
            ['s'] = actions.select_horizontal,
          },
          i = {
            ['<C-t>'] = actions.select_tab,
            ['<C-v>'] = actions.select_vertical,
            ['<C-s>'] = actions.select_horizontal,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { 'fd', '--type', 'f', '-c', 'never', '--hidden' },
          hidden = true,
        },
      },
    })
    local keymap = vim.keymap.set
    local default_opts = {}
    keymap('n', '<LEADER>ff', builtin.find_files, default_opts)
    keymap('n', '<LEADER>fg', builtin.live_grep, default_opts)
    keymap('n', '<LEADER>fr', builtin.oldfiles, default_opts)
    keymap('n', '<LEADER>fh', builtin.help_tags, default_opts)
    keymap('n', '<LEADER>fk', builtin.keymaps, default_opts)
    keymap('n', '<LEADER>fw', builtin.grep_string, default_opts)
  end,
}
