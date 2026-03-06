{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.desktop-environment.audio.pamixer.enable {
    home.packages = with pkgs; [
      pamixer
    ];
  };
}
