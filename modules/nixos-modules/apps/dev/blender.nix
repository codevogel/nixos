{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.blender.enable {
    environment.systemPackages = with pkgs; [
      blender
    ];
  };
}
