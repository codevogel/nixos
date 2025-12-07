[
  # Clear search highlight
  {
    key = "<Esc>";
    mode = "n";
    action = "<cmd>nohlsearch<CR>";
    desc = "Clear search highlight";
  }

  # Diagnostic list
  {
    key = "<leader>q";
    mode = "n";
    action = "vim.diagnostic.setloclist";
    desc = "Open diagnostic quickfix list";
    lua = true;
  }

  # Exit terminal mode
  {
    key = "<Esc><Esc>";
    mode = "t";
    action = "<C-\\><C-n>";
    desc = "Exit terminal mode";
  }

  # Make Ctrl+C behave like escape
  {
    key = "<C-C>";
    mode = [ "i" "n" "v" ];
    action = "<Esc>";
    desc = "Make Ctrl+C behave exactly like Escape";
  }

  # Window navigation (Ctrl + hjkl)
  {
    key = "<C-h>";
    mode = "n";
    action = "<C-w><C-h>";
    desc = "Move focus to the left window";
  }
  {
    key = "<C-l>";
    mode = "n";
    action = "<C-w><C-l>";
    desc = "Move focus to the right window";
  }
  {
    key = "<C-j>";
    mode = "n";
    action = "<C-w><C-j>";
    desc = "Move focus to the lower window";
  }
  {
    key = "<C-k>";
    mode = "n";
    action = "<C-w><C-k>";
    desc = "Move focus to the upper window";
  }

  # Move lines up/down
  {
    key = "<up>";
    mode = "n";
    action = ":m--<CR>";
    desc = "Move line up";
  }
  {
    key = "<down>";
    mode = "n";
    action = ":m+<CR>";
    desc = "Move line down";
  }

  # Move to start/end of line
  {
    key = "<left>";
    mode = "n";
    action = "0";
    desc = "Move to start of line";
  }
  {
    key = "<right>";
    mode = "n";
    action = "$";
    desc = "Move to end of line";
  }

  # Override gg → gg0
  {
    key = "gg";
    mode = "n";
    action = "gg0";
    desc = "Go to first character of file";
  }
]
