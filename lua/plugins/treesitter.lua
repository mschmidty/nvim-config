return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"Glench/Vim-Jinja2-Syntax",
		},
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				ensure_installed = {
					"r",
					"markdown",
					"markdown_inline",
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
					"vue",
					"typescript",
					-- "latex",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.stan = {
				install_info = {
					url = "https://github.com/WardBrian/tree-sitter-stan",
					files = { "src/parser.c" },
					branch = "main",
					generate_requires_npm = false,
					requires_generate_from_grammar = false,
				},
				filetype = "stan",
			}
		end,
	},
}
