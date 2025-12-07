{
  pkgs,
  lib,
  ...
}: {
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    statusline.lualine.enable = true;

    lsp.enable = true;
    languages = {
      enableTreesitter = true;

      nix.enable = true;
    };

    autocomplete = {
      blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
      };
    };

    diagnostics = {
      enable = true;
      config = {
        virtual_lines = true;
      };
    };

    keymaps = import ./keymaps.nix;
  };
}
