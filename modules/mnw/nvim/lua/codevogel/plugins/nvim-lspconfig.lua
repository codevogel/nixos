return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local servers = {
      lua_ls = {},
      bashls = {},
    }

    for server_name, opts in pairs(servers) do
      vim.lsp.enable(server_name)
    end
  end,
  keys = {
    {
      "<leader>cr",
      vim.lsp.buf.rename,
      desc = "LSP: [C]ode [R]ename",
      mode = "n",
    },
    {
      "<leader>ca",
      vim.lsp.buf.code_action,
      desc = "LSP: [C]ode [A]ction",
      mode = { "n", "x" },
    },
  },
}
