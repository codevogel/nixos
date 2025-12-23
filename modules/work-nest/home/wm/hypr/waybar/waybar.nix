{ ... }:

{
  programs.waybar = {
    settings = {
      mainBar = {
        modules-right = [
          "bluetooth"
        ];
      };

      "bluetooth" = {
        format = "";
        format-disabled = "󰂲";
        format-connected = "󰂱";
        format-no-controller = "";
        tooltip-format = "Devices connected: {num_connections}";
      };
    };
  };

}
