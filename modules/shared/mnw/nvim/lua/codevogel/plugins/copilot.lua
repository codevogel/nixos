return {
  "github/copilot.vim",
  config = function()
    -- Disable default Tab mapping
    vim.g.copilot_no_tab_map = true

    vim.keymap.set("i", "<C-p>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = true,
    })
  end,
}
