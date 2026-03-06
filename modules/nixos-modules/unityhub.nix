{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.gui.unityhub.enable {
    environment.systemPackages = with pkgs; [
      unityhub
    ];
  };
}
