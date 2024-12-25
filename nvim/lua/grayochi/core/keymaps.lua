local keymap = vim.keymap.set

keymap("n", "//", [[:let @/=""<CR>]], { desc = "Clear search highlights" })
keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- window management
keymap("n", "sv", "<C-w>v", { desc = "Split window vertically"})
keymap("n", "sh", "<C-w>s", { desc = "Split window horizontally"})
keymap("n", "se", "<C-w>=", { desc = "Make split qeual size"})
keymap("n", "sx", ":close<CR>", { desc = "Close current split window"})

keymap("n", "to", ":tabnew<CR>", { desc = "Open new tab"})
keymap("n", "tf", ":tabnew %<CR>", { desc = "Open current buffer in new tab"})
keymap("n", "tx", ":tabclose<CR>", { desc = "Close tab"})
keymap("n", "tn", ":tabn<CR>", { desc = "Go to next tab"})
keymap("n", "tp", ":tabp<CR>", { desc = "Go to previous tab"})

