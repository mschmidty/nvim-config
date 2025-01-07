return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			-- Load VSCode-style snippets from 'friendly-snippets'
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Load your custom snippets from a custom directory
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
			require("luasnip.loaders.from_lua").load({ paths = "~/AppData/Local/nvim/lua/snippets" })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"R-nvim/cmp-r",
			"jc-doyle/cmp-pandoc-references",
		},
		config = function()
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			cmp.event:on("comfirm_done", cmp_autopairs.on_confirm_done())

			_G.cmp_active = true

			cmp.setup({
				enabled = function()
					return _G.cmp_active
				end,
				-- enabled = function()
				-- 	if vim.bo.filetype == "markdown" then
				-- 		return false
				-- 	end
				-- 	return true
				-- end,

				snippet = {
					expand = function(args)
						("luasnip").lsp_expand(args.body)
					end,
				},
				-- debug = true,
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-y>"] = cmp.mapping(cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
						{ "i", "c" },
					})),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "cmp_r" },
					{ name = "pandoc_references" },
					{ name = "lua_ls" },
				}, {
					{ name = "buffer" },
				}),
			})
			vim.keymap.set("n", "<leader>tc", function()
				_G.cmp_active = not _G.cmp_active
				print("nvim-cmp is now " .. (_G.cmp_active and "enabled" or "disabled"))
			end, { desc = "Toggle nvim-cmp" })
		end,
	},
}
