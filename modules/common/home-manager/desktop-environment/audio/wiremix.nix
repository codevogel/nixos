{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.desktop-environment.audio.wiremix.enable {
    home.packages = with pkgs; [
      wiremix
    ];
  };
}
