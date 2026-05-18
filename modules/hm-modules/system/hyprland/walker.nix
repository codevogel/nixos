{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.system.hyprland.walker.enable {
    services = {
      elephant.enable = true;
      walker.enable = true;
      walker.enableElephantIntegration = true;
    };
  };
}
