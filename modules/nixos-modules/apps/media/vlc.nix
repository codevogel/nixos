{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.desktop-environment.media-player.vlc.enable {
    environment.systemPackages = with pkgs; [
      vlc
    ];
  };
}
