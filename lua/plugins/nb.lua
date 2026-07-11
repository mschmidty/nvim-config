return {
	dir = "~/Dropbox/nvim/nb.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		{
			"saghen/blink.cmp",
			opts = {
				sources = {
					default = { "nb" },
					providers = {
						nb = {
							name = "nb",
							module = "nb.blink",
							score_offset = 100,
						},
					},
				},
			},
		},
	},
	config = function()
		require("nb").setup({
			link_format = "title",
		})
	end,
}
