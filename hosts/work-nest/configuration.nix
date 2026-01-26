{ ... }:

{
  imports = [
    ../shared.nix
    ./hardware-configuration.nix
    ../../modules/shared/system/system.nix
    ../../modules/work-nest/system/nvidia.nix
    ../../modules/work-nest/system/networking.nix
    ../../modules/work-nest/system/home-manager.nix
    ../../modules/work-nest/system/bluetooth.nix
    ../../modules/work-nest/system/theme.nix
  ];
}
