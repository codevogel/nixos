{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.dev.gui.godot.enable = lib.mkEnableOption "Enable dev.gui.godot" // {
      default = config.host-options.home-manager.dev.gui.enable;
    };
  };

  config = lib.mkIf config.host-options.dev.gui.godot.enable {
    home.packages = with pkgs; [
      godot
      #godotPAckages_4_6.godot
    ];
  };
}
