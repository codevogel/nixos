require("codevogel.config.options")
require("codevogel.config.diagnostic")
require("codevogel.config.keymaps")

vim.cmd("colorscheme kanagawa")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "svelte" },
  callback = function()
    vim.treesitter.start()
  end,
})
