require('config.options')
require('config.plugins')
require('config.keymaps')
require('config.colorscheme')
require('config.lsp')

-- Plugins setup
require('config.formatter')
require('config.autocomplete')
require('config.treesitter')
require('config.mason')

-- Enable transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
