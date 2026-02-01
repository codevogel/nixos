{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __LIBVA_DRIVER_NAME = "nvidia";
    QT_QPA_PLATFORM = "wayland";
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    hyprshutdown
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Note: Hyprland (may) require nvidia drivers
  #       Those are listed in ./nvidia.nix

  # Hyprland conf is in ../../modules/home-manager/wm/hyprland.nix
}
