return {
	"MeanderingProgrammer/markdown.nvim",
	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	ft = { "markdown", "quarto" },
	opts = {},
	---@module 'render-markdown'
	---@type render.md.UserConfig
	config = function()
		require("render-markdown").setup({
			latex = { enabled = false },
		})
	end,
}
