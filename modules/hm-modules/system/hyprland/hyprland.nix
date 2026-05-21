{
  lib,
  pkgs,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.system.hyprland.enable {

    services.hyprpaper.enable = true;

    home = {
      packages = [ pkgs.hyprpaper ];

      sessionVariables = {
        NIXOS_OZONE_WL = "1"; # Hint electron apps to use WL
        HYPRLAND_STUBS_PATH = "${pkgs.hyprland}/share/hypr/stubs";
      };
      file.".local/share/icons/theme_codevogel" = {
        source = ./cursor/theme_codevogel;
        recursive = true;
      };

      file.".config/hypr/hyprland.lua" = {
        source = ./config/hyprland.lua;
      };

      file.".config/hypr/codevogel" = {
        source = ./config/codevogel;
        recursive = true;
      };

      file.".config/hypr/codevogel/monitors.lua" = {
        text = lib.mkDefault ''
          -- This file is a stub and should be overridden in
          -- a host that requires specific montitor settings with something like:
          --
          --  home-manager.users.codevogel = {
          --     home.file.".config/hypr/codevogel/monitors.lua" = lib.mkForce {
          --     text = \'\'
          --       hl.monitor({
          --       	output = "DP-3",
          --       	mode = "3440x1440@143.97",
          --       	position = "0x0",
          --       	scale = 1,
          --       })
          --     \'\';
          --   };
          -- };
        '';
      };
    };
  };
}
