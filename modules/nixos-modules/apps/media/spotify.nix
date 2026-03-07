{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf osConfig.my.features.apps.media.spotify.enable
      {
        environment.systemPackages = with pkgs; [
          spotify
        ];
      };
}
