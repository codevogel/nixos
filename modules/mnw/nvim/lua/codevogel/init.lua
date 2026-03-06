require("codevogel.config.options")
require("codevogel.config.diagnostic")
require("codevogel.config.keymaps")

vim.cmd("colorscheme kanagawa")

require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("LoadTreesitter", { clear = true }),
  callback = function(args)
  pcall(vim.treesitter.start, args.buf)
  end,
})
