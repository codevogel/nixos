{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.gui.godot.enable {
    home.packages = with pkgs; [
      godot
      #godotPAckages_4_6.godot
    ];
  };
}
