{
  lib,
  osConfig,
  ...
}:

{
  config =
    lib.mkIf (osConfig.my.features.system.hyprland.waybar.enable or false)
      {
        programs.waybar = {
          enable = true;

          settings = {
            mainBar = lib.mkMerge [

              # Base bar
              {
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

                # Base modules
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

                # Base tray-expander
                "group/tray-expander" = {
                  orientation = "inherit";
                  drawer = {
                    transition-duration = 600;
                    children-class = "tray-group-item";
                  };

                  modules = lib.concatLists [
                    [
                      "custom/expand-icon"
                      "tray"
                    ]
                    (lib.optionals
                      (osConfig.my.features.system.hyprland.waybar.laptopModules.enable
                        or false
                      )
                      [
                        "bluetooth"
                        "battery"
                        "backlight"
                      ]
                    )
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
              }

              # Laptop-specific modules (attributes)
              (lib.mkIf
                (osConfig.my.features.system.hyprland.waybar.laptopModules.enable
                  or false
                )
                {
                  "backlight" = {
                    device = "intel_backlight";
                    format = "{icon}";
                    format-icons = [
                      "󰃞"
                      "󰃟"
                      "󰃠"
                    ];
                  };

                  "bluetooth" = {
                    format = "";
                    format-disabled = "󰂲";
                    format-connected = "󰂱";
                    format-no-controller = "";
                    tooltip-format = "Devices connected: {num_connections}";
                    on-click = "sh -c 'rfkill unblock bluetooth && kitty --title bluetui -e bluetui'";
                    on-click-right = "sh -c 'bluetoothctl power off && rfkill block bluetooth'";
                  };

                  "battery" = {
                    format = "{capacity}% {icon}";
                    format-discharging = "{icon}";
                    format-charging = "{icon}";
                    format-plugged = "";

                    format-icons = {
                      charging = [
                        "󰢜"
                        "󰂆"
                        "󰂇"
                        "󰂈"
                        "󰢝"
                        "󰂉"
                        "󰢞"
                        "󰂊"
                        "󰂋"
                        "󰂅"
                      ];
                      default = [
                        "󰁺"
                        "󰁻"
                        "󰁼"
                        "󰁽"
                        "󰁾"
                        "󰁿"
                        "󰂀"
                        "󰂁"
                        "󰂂"
                        "󰁹"
                      ];
                    };

                    format-full = "󰂅";
                    tooltip-format-discharging = "{power:>1.0f}W↓ {capacity}%";
                    tooltip-format-charging = "{power:>1.0f}W↑ {capacity}%";
                    interval = 5;

                    states = {
                      warning = 20;
                      critical = 10;
                    };
                  };
                }
              )
            ];
          };

          style = builtins.readFile ./waybar.css;
        };
      };
}
