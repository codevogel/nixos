return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "nixfmt" },
      sh = { "beautysh" },
      markdown = { "prettierd", "markdownlint-cli2" },
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({
          bufnr = args.buf,
          timeout_ms = 500,
          lsp_format = "fallback",
        })
        require("hatch").hatch()
      end,
    })
  end,
}
