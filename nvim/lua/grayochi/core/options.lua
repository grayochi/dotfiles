vim.cmd("let g:netrw_liststyle = 3")

local o = vim.opt

o.number = true

o.relativenumber = true

-- tab && indentation
o.autoindent = true
o.tabstop = 2      -- 0 for tabstop
o.shiftwidth = 0
o.softtabstop = -1 -- 0 for tabstop, -1 for shiftwidth
o.expandtab = true

-- search settings
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- backspace
o.backspace = [[indent,eol,start]]

-- clipboard
o.clipboard = [[unnamed,unnamedplus]]
