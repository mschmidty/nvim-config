return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          'r',
          'markdown',
          'markdown_inline',
          'bash',
          'yaml',
          'lua',
          'vim',
          'query',
          'vimdoc',
          'html',
          'css',
          'dot',
          'javascript',
          'norg'
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
