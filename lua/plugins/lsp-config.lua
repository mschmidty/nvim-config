return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
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
		dependencies = {
			"saghen/blink.cmp",
			"barreiroleo/ltex_extra.nvim",
		},
		lazy = false,
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- 1. Apply blink.cmp capabilities globally to all LSP servers
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- 2. Server-specific configurations
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.config("ltex_plus", {
				on_attach = function(client, bufnr)
					-- Initialize ltex_extra when ltex_plus attaches to the buffer
					require("ltex_extra").setup({
						load_langs = { "en-US" }, -- Add any languages you write in
						init_check = true, -- Load saved dictionaries on startup
						path = vim.fn.stdpath("config") .. "/spell", -- Where dictionaries and disabled rules are stored
						log_level = "none",
					})
				end,
				settings = {
					ltex = {
						enabled = { "rmd", "quarto", "latex", "tex", "bib", "markdown", "org", "text" },
						language = "en-US",
						checkFrequency = "save",
						additionalRules = {
							enablePickyRules = true,
							motherTongue = "en-US",
						},
					},
				},
			})

			vim.lsp.config("emmet_language_server", {
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"pug",
					"typescriptreact",
				},
				init_options = {
					includeLanguages = {
						["php"] = "html",
					},
					excludeLanguages = {},
					extensionsPath = {},
					preferences = {},
					showAbbreviationSuggestions = true,
					showExpandedAbbreviation = "always",
					showSuggestionsAsSnippets = false,
					syntaxProfiles = {},
					variables = {},
				},
			})

			-- 3. Enable all configured servers
			vim.lsp.enable({
				"ts_ls",
				"html",
				"lua_ls",
				"gopls",
				"ltex_plus",
				"air",
				"harper_ls",
				"emmet_language_server",
			})

			-- 4. Function to toggle ltex language server on/off
			function ToggleLtex()
				local clients = vim.lsp.get_clients({ name = "ltex_plus" })
				if #clients > 0 then
					vim.lsp.enable("ltex_plus", false)
					print("ltex language server stopped")
				else
					vim.lsp.enable("ltex", true)
					print("ltex language server started")
				end
			end

			-- 5. Keymaps
			vim.keymap.set("n", "<leader>lt", ToggleLtex, { noremap = true, silent = true, desc = "Toggle LTeX LSP" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

			-- Set to "warn" or "error" for normal use ("debug" can bloat ~/.local/state/nvim/lsp.log)
			vim.lsp.log.set_level("warn")
		end,
	},
}
