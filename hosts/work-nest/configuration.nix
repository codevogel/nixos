{ ... }:

{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
  ];

  my.features.system.hyprland.waybar.laptopModules.enable = true;
}
