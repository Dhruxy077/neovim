return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.config")
			config.setup({
				ensure_installed = {
					"rust",
					"javascript",
					"lua",
					"c",
					"cpp",
					"go",
					"java",
					"python",
					"typescript",
					"tsx",
					"html",
					"css",
					"vimdoc",
				},
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "<filetype>" },
				callback = function()
					vim.treesitter.start()
				end,
			})
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	},
}
