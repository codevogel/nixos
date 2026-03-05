{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.system.desktop-environment.hyprland.enable =
      lib.mkEnableOption "Enable desktop-environment.hyprland"
      // {
        default = config.host-options.system.desktop-environment.enable;
      };
  };

  config = lib.mkIf config.host-options.system.desktop-environment.hyprland.enable {

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
  };
}
