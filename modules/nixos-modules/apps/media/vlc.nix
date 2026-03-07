{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.media.vlc.enable {
    environment.systemPackages = with pkgs; [
      vlc
    ];
  };
}
