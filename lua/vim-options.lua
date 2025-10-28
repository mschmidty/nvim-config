vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.background = "light"

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- vim.opt.timeoutlen = 1000

vim.opt.swapfile = false

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.wo.wrap = false

-- on wrap don't break lines
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "qmd" },
	callback = function()
		vim.opt_local.linebreak = true
		vim.opt.conceallevel = 2
		vim.opt.concealcursor = "nc" -- optional: show conceal in normal and command modes
	end,
})

vim.filetype.add({
	extension = {
		stan = "stan",
	},
})

if vim.loop.os_uname().sysname == "Windows_NT" then
	vim.g.sqlite_clib_path =
		"C:\\Users\\MichaelSchmidt2\\AppData\\Local\\sqlite\\sqlite-dll-win-x64-3470200\\sqlite3.dll"
end
