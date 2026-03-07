{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.blender.enable {
    environment.systemPackages = with pkgs; [
      blender
    ];
  };
}
