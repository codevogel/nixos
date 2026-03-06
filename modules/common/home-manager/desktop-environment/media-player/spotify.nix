{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf osConfig.host-options.home-manager.desktop-environment.media-player.spotify.enable
      {
        home.packages = with pkgs; [
          spotify
        ];
      };
}
