{ ... }:

{
  programs.waybar = {
    settings = {
      mainBar = {

        modules-right = [
          "bluetooth"
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

      };
    };
  };

}
