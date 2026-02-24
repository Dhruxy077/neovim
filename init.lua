vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "H", ":tabp<CR>", {})
vim.keymap.set("n", "L", ":tabn<CR>", {})
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", {})
vim.keymap.set("i","jk","<Esc>",{ noremap = true, silent = true})
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = {}

require("lazy").setup("plugins")

require("lazy").setup({ plugins, opts })
--require("keymaps")
require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})
