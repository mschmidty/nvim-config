return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				ensure_installed = {
					"bash",
					"yaml",
					"lua",
					"vim",
					"query",
					"vimdoc",
					"html",
					"css",
					"dot",
					"javascript",
					"typescript",
					-- "latex",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
