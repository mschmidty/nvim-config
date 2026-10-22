return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		dependencies = {
			"Glench/Vim-Jinja2-Syntax",
		},
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter")
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
					"python",
					-- "latex",
				},
			})
			vim.treesitter.language.register("markdown", { "rmd", "quarto" })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "quarto", "rmd", "markdown" },
				callback = function(args)
					vim.treesitter.start(args.buf, "markdown")
				end,
			})
			-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			-- parser_config.stan = {
			-- 	install_info = {
			-- 		url = "https://github.com/WardBrian/tree-sitter-stan",
			-- 		files = { "src/parser.c" },
			-- 		branch = "main",
			-- 		generate_requires_npm = false,
			-- 		requires_generate_from_grammar = false,
			-- 	},
			-- 	filetype = "stan",
			-- }
		end,
	},
}
