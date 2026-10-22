return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"jmbuhr/telescope-zotero.nvim",
				dependencies = {
					{ "kkharji/sqlite.lua" },
				},
				-- options:
				-- to use the default opts:
				opts = {},
				-- to configure manually:
				config = function()
					local zotero = require("zotero")
					zotero.setup({})
					vim.keymap.set("n", "<leader>fz", ":Telescope zotero<cr>", { desc = "[z]otero" })
				end,
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"_targets/",
						"%.git/",
						"node_modules/",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

			telescope.load_extension("ui-select")
			telescope.load_extension("zotero")
		end,
	},
}
