return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function ()
    local null_ls = require("null_ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.r_language_server
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
