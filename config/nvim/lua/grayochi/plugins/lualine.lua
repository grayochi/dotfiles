return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')
    local lazy_status = require('lazy.status')

    local function total_lines()
    return 'Total:' .. vim.api.nvim_buf_line_count(0)
    end


    lualine.setup({
      options = {
        theme = 'tokyonight',
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 2, -- show full path
          }
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { 'encoding' },
          { 'fileformat' },
          { 'filetype' },
        },
        lualine_z = {
          { total_lines },
        }
      },
    })
  end
}
