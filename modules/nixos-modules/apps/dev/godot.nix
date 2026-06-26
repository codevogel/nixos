{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.godot.enable {
    environment.systemPackages = with pkgs; [
      godotPackages_4_7.godot
      godotPackages_4_7.godot-mono
    ];
  };
}
