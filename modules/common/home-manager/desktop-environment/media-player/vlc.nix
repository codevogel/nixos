{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.desktop-environment.media-player.vlc.enable {
    home.packages = with pkgs; [
      vlc
    ];
  };
}
