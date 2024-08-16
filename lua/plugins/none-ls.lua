  return {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.styler,
        },
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_command("augroup Format")
            vim.api.nvim_command("autocmd! * <buffer>")
            vim.api.nvim_command("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
            vim.api.nvim_command("augroup END")
          end
        end,
      })
    end, 
  }
