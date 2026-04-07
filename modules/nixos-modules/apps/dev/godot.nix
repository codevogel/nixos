{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.godot.enable {
    environment.systemPackages = with pkgs; [
      godot
      godot-mono
    ];
  };
}
