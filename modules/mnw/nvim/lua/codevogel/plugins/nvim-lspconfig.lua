return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    -- Servers to enable, with their config.
    -- Empty configs use the nvim-lspconfig defaults.
    local servers = {
      lua_ls = {},
      bashls = {},
    }

    for server_name, cfg in pairs(servers) do
      vim.lsp.config(server_name, cfg)
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
