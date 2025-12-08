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

    globals.mapleader = " ";

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

    utility = {
      snacks-nvim = {
        enable = true;
        setupOpts = {
          bigfile = { enabled = true; };
          dashboard = { enabled = true; };
          explorer = { enabled = true; };
          indent = { enabled = true; };
          input = { enabled = true; };
          picker = { enabled = true; };
          notifier = { enabled = true; };
          quickfile = { enabled = true; };
          scope = { enabled = true; };
          scroll = { enabled = true; };
          statuscolumn = { enabled = true; };
          words = { enabled = true; };
          zen = { enabled = true; };
        };
      };
    };

    keymaps = import ./keymaps.nix;
  };
}
