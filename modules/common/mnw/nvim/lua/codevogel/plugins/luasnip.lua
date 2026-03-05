return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",

  config = function()
    local snippet_paths = vim.api.nvim_get_runtime_file("lua/codevogel/snippets", true)
    require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_paths })
  end,
  keys = {
    {
      "<C-h>",
      function()
        require("luasnip").jump(-1)
      end,
      mode = { "i", "s" },
      desc = "Jump to previous snippet placeholder",
    },
    {
      "<C-l>",
      function()
        require("luasnip").jump(1)
      end,
      mode = { "i", "s" },
      desc = "Jump to previous snippet placeholder",
    },
  },
}
