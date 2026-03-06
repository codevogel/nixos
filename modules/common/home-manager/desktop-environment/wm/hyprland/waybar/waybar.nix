{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.desktop-environment.wm.hyprland.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          modules-left = [
            "hyprland/workspaces"
            "hyprland/workspaces#windows"
            "mpris"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "group/tray-expander"
            "network"
            "pulseaudio"
          ];
          "hyprland/workspaces" = {
            format = "{icon}";
            format-window-separator = "";
            format-icons = {
              default = "";
              active = "";
              urgent = "";
            };
            persistent-workspaces = {
              "1" = [ ];
              "2" = [ ];
              "3" = [ ];
              "4" = [ ];
              "5" = [ ];
            };
          };

          "hyprland/workspaces#windows" = {
            active-only = true;
            format = "{windows}";
            workspace-taskbar = {
              enable = true;
              update-active-window = true;
              format = "{icon}";
              icon-size = 16;
              orientation = "horizontal";
              on-click-window = "${./scripts/focus-window.sh} {address} {button}";
            };
          };

          "clock" = {
            format = "{:%H:%M on %a %d-%m-%Y}";
            tooltip = false;
            on-click = "kitty --title khal -e khal";
          };

          "mpris" = {
            format = "{player_icon} {dynamic}";
            format-paused = "{status_icon} <i>{dynamic}</i>";
            interval = 1;
            dynamic-order = [
              "title"
              "artist"
              "position"
              "length"
            ];
            player-icons = {
              default = "▶";
            };
            status-icons = {
              paused = "⏸";
            };

          };

          "network" = {
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format = "{icon}";
            format-wifi = "{icon}";
            format-ethernet = "󱘖";
            format-disconnected = "󰤮";
            tooltip-format-wifi = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
            tooltip-format-ethernet = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
            tooltip-format-disconnected = "Disconnected";
            interval = 3;
            spacing = 1;
            on-click = "kitty --title gazelle -e gazelle";
          };

          "pulseaudio" = {
            format = "{icon}";
            format-icons = {
              default = [
                ""
                ""
                ""
              ];
            };
            format-muted = "";
            on-click = "kitty --title wiremix -e wiremix";
            on-click-right = "pamixer -t";
          };

          "group/tray-expander" = {
            orientation = "inherit";

            drawer = {
              transition-duration = 600;
              children-class = "tray-group-item";
            };

            modules = [
              "custom/expand-icon"
              "tray"
            ];
          };

          "custom/expand-icon" = {
            format = "";
            tooltip = false;
          };

          "tray" = {
            icon-size = 12;
            spacing = 17;
          };

          reload_style_on_change = true;
        };
      };
      style = builtins.readFile ./waybar.css;
    };

  };
}
