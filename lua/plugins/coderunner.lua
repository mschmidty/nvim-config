return {
	{
		"preservim/vimux",
		config = function()
			vim.g.VimuxOrientation = "h"
			vim.g.VimuxWidth = 100
		end,
	},
	{
		"CRAG666/code_runner.nvim",
		config = function()
			require("code_runner").setup({
				mode = "vimux",
				filetype = {
					javascipt = "node $fileName",
					python = "python $fileName",
				},
			})
			vim.keymap.set("n", "<leader>r", "<cmd>RunCode<CR>", { desc = "Run file (CodeRunner)" })
			vim.keymap.set("n", "<leader>rf", "<cmd>RunFile<CR>", { desc = "Run file explicitly" })
			vim.keymap.set("n", "<leader>rp", "<cmd>RunProject<CR>", { desc = "Run project" })
		end,
	},
}
