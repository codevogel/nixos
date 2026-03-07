{ ... }:

{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
    ../../modules/work-nest/default.nix
  ];

  my.features.system.hyprland.waybar.laptopModules.enable = true;
}
