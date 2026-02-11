return {
  "github/copilot.vim",
  config = function()
    -- Disable default Tab mapping
    vim.g.copilot_no_tab_map = true

    -- Accept suggestion with Shift+Tab
    vim.keymap.set("i", "<C-Tab>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
  end
}
