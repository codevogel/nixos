{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.downloader.qbittorrent.enable {
    home.packages = with pkgs; [
      qbittorrent
    ];
  };
}
