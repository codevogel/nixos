{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.media.vlc.enable {
    environment.systemPackages = with pkgs; [
      vlc
    ];
  };
}
