{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.desktop-environment.bluetooth.bluetui.enable {
    home.packages = with pkgs; [
      bluetui
    ];
  };
}
