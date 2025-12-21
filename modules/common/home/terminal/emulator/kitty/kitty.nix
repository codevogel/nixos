{ pkgs, lib, ... }:

let
  themeKanagawa = import ./themes/kanagawa.nix;
in
{
  home.packages = [
    pkgs.kitty
  ];

  programs.kitty = {
    enable = true;
    font = {
      name = lib.mkForce "JetBrains Mono Nerd Font Mono";
      size = 12;
    };

    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    }
    // themeKanagawa;
  };
}
