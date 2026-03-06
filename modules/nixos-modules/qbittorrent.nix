{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.downloader.qbittorrent.enable {
    environment.systemPackages = with pkgs; [
      qbittorrent
    ];
  };
}
