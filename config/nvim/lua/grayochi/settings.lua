local o = vim.opt
local wo = vim.wo

-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking text.',
--   group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

-- Copy indent to the new line.
o.autoindent = true

-- Allow backspace in insert mode.
-- o.backspace=2
o.backspace = [[indent,eol,start]]

-- Use the system clipboard as the default register.
o.clipboard = [[unnamed,unnamedplus]]

-- Turn off swap files.
o.swapfile = false
o.backup = false
o.wb = false

-- Search settings.
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- Use custom symbols to represent invisible characters.
o.list = true
o.listchars=[[tab:\ \,trail:·]]

-- Lua does not support.
-- Disable for security reason.
o.modeline = false

-- Enable mouse control.
o.mouse = 'a'

-- Show line number.
o.number = true

-- Show cursor position.
o.ruler = true

-- Show the command being typed.
o.showcmd = true

-- Show current mode.
o.showmode = true

-- Show
o.showmatch = true

-- When scrolling keep the cursor 5 lines below
-- the top and 8 lines above the bottom of the screen.
o.scrolloff = 8

-- Set global <tab> settings.
o.tabstop = 2
-- 0 for tabstop
o.shiftwidth = 0
-- -1 for shiftwidth
o.softtabstop = -1
o.expandtab = true

-- Disable beeping and window flashing.
-- https://vim.wikia.com/wiki/Disable_beeping
o.visualbell = true
o.errorbells = false

-- Enable enhanced command-line completion.
o.wildmenu = true
o.wildignore = { '*.o', '*.obj', '*.~'}
o.wildignore.append = { '*DS_Store*'}
o.wildignore.append = { '*.gem'}
o.wildignore.append = { 'log/**'}
o.wildignore.append = { 'tmp/**'}
o.wildignore.append = { '*.png', '*.jpg', '*.gif'}
