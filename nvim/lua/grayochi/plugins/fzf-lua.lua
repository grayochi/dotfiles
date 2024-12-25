return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local keymap = vim.keymap.set
    local default_opts = {}
    local fzf = require('fzf-lua')
    keymap('n', '<LEADER>ff', fzf.files, {})
    keymap('n', '<LEADER>fg', fzf.live_grep, default_opts)
    keymap('n', '<LEADER>fr', fzf.live_grep_resume, default_opts)
    keymap('n', '<LEADER>fk', fzf.keymaps, default_opts)
    keymap('n', '<LEADER>gb', fzf.git_blame, default_opts)
    keymap('n', '<LEADER>fr', fzf.oldfiles, default_opts)
    keymap('n', '<LEADER>fh', fzf.help_tags, default_opts)
  end
}
