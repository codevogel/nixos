{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.dev.gui.blender.enable = lib.mkEnableOption "Enable dev.gui.blender" // {
      default = config.host-options.home-manager.dev.gui.enable;
    };
  };

  config = lib.mkIf config.host-options.dev.gui.blender.enable {
    home.packages = with pkgs; [
      blender
    ];
  };
}
