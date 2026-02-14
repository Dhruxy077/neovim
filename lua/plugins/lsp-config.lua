return {
	{
		"mason-org/mason.nvim",
		opt = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
	 opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"pyright",
				"clangd",
				"jdtls",
				"ts_ls",
				"html",
				"cssls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Ensure lspconfig is loaded
			local lspconfig = require("lspconfig")

			-- Enable language servers
			local servers = { "pyright", "lua_ls", "rust_analyzer", "clangd", "jdtls", "ts_ls" }
			for _, lsp in ipairs(servers) do
				vim.lsp.enable(lsp)
			end

		--	vim.api.nvim_create_autocmd({
			--	desc = "LSP actions",
				--callback = function(event)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

					-- Additional helpful keybindings
					vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
				--end,
			--}, "LspAttach")
		end,
	},
}
