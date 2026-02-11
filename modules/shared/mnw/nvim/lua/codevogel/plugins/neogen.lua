return {
  "danymat/neogen",
  config = function()
    vim.treesitter.language.register("c_sharp", "cs")
    require("neogen").setup({
      snippet_engine = "luasnip",
      languages = {
        cs = {
          template = {
            annotation_convention = "xmldoc",
          },
        },
      },
    })
  end,
  keys = {
    { "<leader>gd", "<cmd>Neogen<CR>", desc = "Generate documentation" },
  },
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
