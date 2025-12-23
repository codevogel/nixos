{ config, lib, ... }:

{
  hardware.graphics.enable = true;
  hardware.nvidia.open = lib.mkDefault false;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  hardware.nvidia.powerManagement.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # These are for Hyprland but might be useful for other programs too(?)
  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = lib.mkDefault "nvidia";
    LIBVA_DRIVER_NAME = lib.mkDefault "nvidia";
  };

  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
}
