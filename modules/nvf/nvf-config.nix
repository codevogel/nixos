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
  };
}
