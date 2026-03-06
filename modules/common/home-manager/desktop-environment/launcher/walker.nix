{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.desktop-environment.launcher.walker.enable {
    home.packages = with pkgs; [
      walker
    ];
  };
}
