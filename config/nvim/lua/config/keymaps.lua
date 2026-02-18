-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Fuzzy finder
vim.keymap.set("n", "<leader>ff", ":Files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fh", ":History<CR>", { desc = "File history" })
vim.keymap.set("n", "<leader>fb", ":Buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fg", ":Rg ", { desc = "Ripgrep search" })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
