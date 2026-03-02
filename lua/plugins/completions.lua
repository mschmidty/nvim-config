return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			config = function()
				-- Load custom Lua snippets from ~/.config/nvim/lua/snippets/
				require("luasnip.loaders.from_lua").load({
					paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
				})
			end,
		},
	},
	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	opts = {
		-- See :h blink-cmp-config-keymap for defining your own keymap
		enabled = function()
			return vim.g.blink_cmp_enabled ~= false
		end,
		keymap = { preset = "default" },
		snippets = { preset = "luasnip" },

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = { documentation = { auto_show = false } },

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
	config = function(_, opts)
		-- Initialize blink with your opts
		require("blink.cmp").setup(opts)

		-- Create the toggle keybinding (using <leader>ub as an example)
		vim.keymap.set("n", "<leader>tc", function()
			if vim.g.blink_cmp_enabled == false then
				vim.g.blink_cmp_enabled = true
				print("Blink.cmp: ON")
			else
				vim.g.blink_cmp_enabled = false
				print("Blink.cmp: OFF")
			end
		end, { desc = "Toggle Blink Completion" })
	end,
}
