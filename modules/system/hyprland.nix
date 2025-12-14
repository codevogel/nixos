{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __LIBVA_DRIVER_NAME = "nvidia";
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];

  # Note: Hyprland (may) require nvidia drivers
  #       Those are listed in ./nvidia.nix
}
