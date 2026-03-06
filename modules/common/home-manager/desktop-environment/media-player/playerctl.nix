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
        home.packages = with pkgs; [
          playerctl
        ];
      };
}
