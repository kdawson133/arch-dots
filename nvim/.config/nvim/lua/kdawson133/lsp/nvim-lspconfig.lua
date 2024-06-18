return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({})
		lspconfig.tsserver.setup({})
		lspconfig.rust_analyzer.setup({})
		lspconfig.pyright.setup({})
		lspconfig.html.setup({})
		lspconfig.cssls.setup({})
		lspconfig.marksman.setup({})
		lspconfig.emmet_ls.setup({})
		lspconfig.sorbet.setup({})
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
