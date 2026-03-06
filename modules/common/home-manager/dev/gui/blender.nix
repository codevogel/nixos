{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.gui.blender.enable {
    home.packages = with pkgs; [
      blender
    ];
  };
}
