{ pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = ./kanagawa.yaml;
    targets = {
      waybar = {
        addCss = false;
      };
    };

    fonts = {
      serif = {
        package = pkgs.roboto-serif;
        name = "Roboto Serif";
      };

      sansSerif = {
        package = pkgs.plus-jakarta-sans;
        name = "Plus Jakarta Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetbrainsMono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

  };
}
