return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "nixfmt" },
        sh = { "beautysh" },
        markdown = { "prettierd", "markdownlint-cli2" },
        gdscript = { "gdformat" },
      },
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({
          async = true,
          bufnr = args.buf,
          timeout_ms = 1000,
          lsp_format = "fallback",
        })
        require("hatch").hatch()
      end,
    })
  end,
}
