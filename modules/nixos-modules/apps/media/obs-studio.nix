{
  lib,
  config,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf config.my.features.apps.media.obsStudio.enable
      {
        environment.systemPackages = with pkgs; [
          obs-studio
        ];
      };
}
