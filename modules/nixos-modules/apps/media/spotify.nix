{
  lib,
  config,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf config.my.features.apps.media.spotify.enable
      {
        environment.systemPackages = with pkgs; [
          spotify
        ];
      };
}
