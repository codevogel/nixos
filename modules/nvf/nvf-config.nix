{ pkgs, lib, ... }:

{
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    statusline.lualine.enable z true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
    };
  };
