return {
  "teatek/gdscript-extended-lsp.nvim",
  opts = {
    doc_file_extension = ".txt",
    view_type = "floating",
    keymaps = {
      declaration = "gd", -- Keymap to go to definition
      close = { "q", "<Esc>" }, -- Keymap for closing the documentation
    },
    floating_win_size = 0.8, -- Floating window size
    picker = "snacks", -- Options : "telescope", "snacks", "fzf-lua"
  },
}
