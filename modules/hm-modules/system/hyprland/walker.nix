{
  lib,
  osConfig,
  inputs,
  ...
}:

{
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  config = lib.mkIf osConfig.my.features.system.hyprland.walker.enable {
    programs.walker.enable = true;
  };
}
