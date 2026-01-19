return {
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"mfussenegger/nvim-dap-python", -- Optional: if you want it to auto-setup the debugger
		},
		event = "VeryLazy", -- Load it lazily to keep startup fast
		config = function()
			require("venv-selector").setup({
				settings = {
					-- Configuration for how the specific venv is cached for this project
					options = {
						notify_user_on_venv_activation = true,
					},
				},
			})
		end,
		keys = {
			{
				"<leader>v",
				"<cmd>VenvSelect<cr>",
				desc = "Select Python VirtualEnv",
			},
		},
	},
	{
		"Vigemus/iron.nvim",
		config = function()
			local iron = require("iron.core")
			iron.setup({
				config = {
					-- Use a vertical split for the REPL
					repl_definition = {
						python = {
							command = { "ipython", "--no-autoindent" }, -- IPython is crucial (see below)
						},
					},
					repl_open_cmd = require("iron.view").split.vertical.botright(0.4),
				},
				keymaps = {
					send_motion = "<leader>sc",
					visual_send = "<leader>sc",
					send_file = "<leader>sf",
					send_line = "<leader>sl",
				},
			})
		end,
	},
}
