{ ... }:

{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
    ../../modules/work-nest/default.nix
  ];

  host-options.home-manager.desktop-environment.wm.hyprland.settings.monitor = [
    "eDP-1, 1920x1200, 0x0, 1"
    "DP-2, 1920x1080, 1920x0, 1"
  ];
}
