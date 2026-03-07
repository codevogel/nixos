{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.qbittorrent.enable {
    environment.systemPackages = with pkgs; [
      qbittorrent
    ];
  };
}
