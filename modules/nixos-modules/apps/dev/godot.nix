{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.godot.enable {
    environment.systemPackages = with pkgs; [
      godot
      #godotPAckages_4_6.godot
    ];
  };
}
