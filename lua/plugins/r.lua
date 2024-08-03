return {
  {
        "R-nvim/R.nvim",
        config = function ()
            -- Create a table with the options to be passed to setup()
            local opts = { R_args = {"--quiet", "--no-save"},
                -- Below is for windows work maching only, should figure out how to only apply on windows.
                R_path = 'C:\\Users\\MichaelSchmidt2\\AppData\\Local\\Programs\\R\\R-4.3.0\\bin\\x64',
                hook = {
                    on_filetype = function ()
                        -- This function will be called at the FileType event
                        -- of files supported by R.nvim. This is an
                        -- opportunity to create mappings local to buffers.
                        vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
                        vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
                        vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>m", "<Cmd>lua require('r.send').cmd('tar_make()')<CR>", {})
                        vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>le", "<Cmd>lua require('r.send').cmd('targets::tar_load_everything()')<CR>", {})
                        vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>ll", "<Cmd>lua require('r.run').action('tar_load')<CR>", {})
                        vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>tm", "<Cmd>lua require('r.run').action('tar_make')<CR>", {})
                        vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>tr", "<Cmd>lua require('r.run').action('tar_read')<CR>", {})
                        vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>ss", ":normal! viw<CR><Plug>RDSendSelection", {})
                    end
                },
                csv_app = "terminal:vd",
                min_editor_width = 72,
                rconsole_width = 78,
                rmdchunk = "``",
                disable_cmds = {
                        "RClearConsole",
                        "RCustomStart",
                        "RSPlot",
                        "RSaveClose",
                    },
                }
                -- Check if the environment variable "R_AUTO_START" exists.
                -- If using fish shell, you could put in your config.fish:
                -- alias r "R_AUTO_START=true nvim"
                if vim.env.R_AUTO_START == "true" then
                    opts.auto_start = 1
                    opts.objbr_auto_start = true
                end
                require("r").setup(opts)
                vim.g.rout_follow_colorscheme = true
            end,
        lazy = false
  },
}
