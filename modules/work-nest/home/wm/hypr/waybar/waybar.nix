{ ... }:

{
  programs.waybar = {
    settings = {
      mainBar = {

        modules-right = [
          "bluetooth"
          "battery"
        ];

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

      };
    };
  };

}
