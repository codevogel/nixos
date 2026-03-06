{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.desktop-environment.wm.hyprland.enable {
    home.packages = with pkgs; [
      mako
      libnotify
    ];

    services.mako = {
      enable = true;
      settings = {
        default-timeout = 4000;
      };
    };

  };
}
