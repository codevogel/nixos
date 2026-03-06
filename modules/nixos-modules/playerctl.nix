{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf osConfig.host-options.home-manager.desktop-environment.media-player.playerctl.enable
      {
        environment.systemPackages = with pkgs; [
          playerctl
        ];
      };
}
