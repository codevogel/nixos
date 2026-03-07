{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.qbittorrent.enable {
    environment.systemPackages = with pkgs; [
      qbittorrent
    ];
  };
}
