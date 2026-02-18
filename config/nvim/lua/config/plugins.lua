local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- Color schemes
Plug("sainnhe/gruvbox-material")
Plug("sainnhe/everforest")
Plug("catppuccin/nvim", { as = "catppuccin" })

-- LSP
Plug("neovim/nvim-lspconfig", { ["tag"] = "v1.6.0" })

-- Formatter
Plug("stevearc/conform.nvim")

-- Autocomplete
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")

-- Mason
Plug("mason-org/mason.nvim")

-- Treesitter
Plug("nvim-treesitter/nvim-treesitter", { ["branch"] = "master", ["do"] = ":TSUpdate" })

-- Fuzzy finder
Plug("junegunn/fzf", { ["do"] = vim.fn["fzf#install"] })
Plug("junegunn/fzf.vim")

-- Git
Plug("tpope/vim-fugitive")

vim.call("plug#end")
