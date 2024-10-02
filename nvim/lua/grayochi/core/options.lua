vim.cmd("let g:netrw_liststyle = 3")

local o = vim.opt

-- encoding
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

o.number = true
o.mouse = 'a'
o.wrap = false
o.clipboard = [[unnamed,unnamedplus]]
o.hidden = true
o.visualbell = true
o.errorbells = false
o.backspace = [[indent,eol,start]]

-- turn off swap files.
o.swapfile = false
o.backup = false
o.wb = false

-- search settings
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- auto compeletion
o.wildmenu = true
o.wildignore = { '*.o', '*.obj', '*.~'}
o.wildignore.append = { '*DS_Store*'}
o.wildignore.append = { '*.gem'}
o.wildignore.append = { 'log/**'}
o.wildignore.append = { 'tmp/**'}
o.wildignore.append = { '*.png', '*.jpg', '*.gif'}

-- turn off model
o.modeline = false

-- tab && indentation
o.autoindent = true
o.tabstop = 2      -- 0 for tabstop
o.shiftwidth = 0
o.softtabstop = -1 -- 0 for tabstop, -1 for shiftwidth
o.expandtab = true

o.showmatch = true

o.list = true
o.listchars=[[tab:\ \,trail:·]]

