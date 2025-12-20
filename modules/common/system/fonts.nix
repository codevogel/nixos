{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      roboto-serif
      plus-jakarta-sans
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Roboto Serif" ];
        sansSerif = [ "Plus Jakarta Sans" ];
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
      };
    };
  };
}
