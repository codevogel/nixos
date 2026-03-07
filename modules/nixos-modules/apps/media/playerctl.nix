{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf osConfig.my.features.apps.media.playerctl.enable
      {
        environment.systemPackages = with pkgs; [
          playerctl
        ];
      };
}
