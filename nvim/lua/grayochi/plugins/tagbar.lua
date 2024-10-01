return {
  'preservim/tagbar',
  config = function()
    -- local keymap = vim.keymap.set
    local opt = vim.opt

    -- keymap('n', 'gs', ':TagbarOpen fj<CR>', { desc: '' }) -- always jump to the Tagbar window, opening it first if necessary
    opt.updatetime = 250
  end,
}

