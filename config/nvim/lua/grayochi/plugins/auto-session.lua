return {
  'rmagatti/auto-session',
  enabled = true,
  config = function()
    local auto_session = require('auto-session')
    auto_session.setup({
      auto_save_enabled = false,
      auto_restore_enabled = false,
    })

    local keymap = vim.keymap.set

    keymap('n', '<LEADER>b', ':SessionRestore<CR>')
    keymap('n', '<LEADER>s', ':SessionSave<CR>')
  end,
}


