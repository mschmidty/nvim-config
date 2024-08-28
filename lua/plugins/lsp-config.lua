return {

	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({})
			lspconfig.ltex.setup({
				cmd = { "ltex-ls" },
				filetypes = { "markdown", "rmarkdown", "quarto" },
				settings = {
					ltex = {
						language = "en-US",
						additionalRules = {
							enablePickyRules = true,
						},
					},
				},
			})

			-- Function to toggle ltex language server
			function ToggleLtex()
				local clients = vim.lsp.get_active_clients()
				for _, client in ipairs(clients) do
					if client.name == "ltex" then
						vim.lsp.stop_client(client.id)
						print("ltex language server stopped")
						return
					end
				end

				-- If ltex is not running, start it
				lspconfig.ltex.setup({})
				print("ltex language server started")
			end
			vim.keymap.set("n", "<leader>lt", ":lua ToggleLtex()<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
