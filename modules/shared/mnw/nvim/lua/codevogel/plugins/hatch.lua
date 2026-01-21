return {
  "codevogel/hatch.nvim",
  opts = {
    template_repository = "git@github.com:codevogel/hatch.nvim-templates.git",
    template_directory = vim.fn.expand("~/.config/hatch.nvim/templates"),
    create_autocmd = false,
  },
}
