return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("nixd", {})
		vim.lsp.enable({ "nixd" })
		vim.lsp.config("lua_ls", {})
		vim.lsp.enable({ "lua_ls" })
	end,
}
