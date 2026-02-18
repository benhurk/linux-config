local configs = require("nvim-treesitter.configs")

configs.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	ensure_installed = {
		"query",
		"lua",
		"bash",
		"css",
	},
	auto_install = false,
})
