return {
  "rose-pine/neovim",
  lazy = false, 
  name = "rose-pine",
  priority = 1000,
  variant = "moon",
  config = function()
    vim.cmd.colorscheme "rose-pine-moon"
  end
}
