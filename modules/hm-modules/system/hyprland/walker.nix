{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.system.hyprland.walker.enable {
    programs.walker.enable = true;
  };
}
