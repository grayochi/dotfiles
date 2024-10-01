return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local nvimtree = require('nvim-tree')

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
      actions = {
        open_file = {
          resize_window = false,
        },
      },
      filters = {
        git_ignored = false,
        dotfiles = false,
        exclude = { 'yarn.sh' },
        custom = { '.git$', 'node_modules/*', '.cache/*', '.yarn/*' },
      },
    })

    local keymap = vim.keymap.set
    keymap('n', '<LEADER>ee', ':NvimTreeToggle<CR>')
    keymap('n', '<LEADER>ef', ':NvimTreeFindFileToggle<CR>')
    keymap('n', '<LEADER>ec', ':NvimTreeCollapse<CR>')
    keymap('n', '<LEADER>er', ':NvimTreeRefresh<CR>')
  end
}
