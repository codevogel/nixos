{
  lib,
  config,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf config.my.features.apps.media.playerctl.enable
      {
        environment.systemPackages = with pkgs; [
          playerctl
        ];
      };
}
