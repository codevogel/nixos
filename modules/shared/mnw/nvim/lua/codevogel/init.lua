require("codevogel.config.options")
require("codevogel.config.diagnostic")
require("codevogel.config.keymaps")

vim.cmd("colorscheme kanagawa")

require("nvim-treesitter").setup({})
vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.treesitter.language._complete(),
  group = vim.api.nvim_create_augroup("LoadTreesitter", {}),
  callback = function()
    vim.treesitter.start()
  end,
})
