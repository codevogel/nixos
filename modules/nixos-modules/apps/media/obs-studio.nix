{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf osConfig.my.features.apps.media.obsStudio.enable
      {
        environment.systemPackages = with pkgs; [
          obs-studio
        ];
      };
}
