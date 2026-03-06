{ ... }:

{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
    ../../modules/home-nest/system/nvidia.nix
  ];

  host-options.home-manager.desktop-environment.wm.hyprland.settings.monitor = [
    "DP-3, 3440x1440@143.97Hz, 0x0, 1"
  ];
}
