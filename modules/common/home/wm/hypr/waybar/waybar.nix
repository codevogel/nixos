{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "pulseaudio"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          "format-icons" = {
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

        "clock" = {
          format = "{:%H:%M on %a %d-%m-%Y}";
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

        reload_style_on_change = true;
      };
    };
    style = builtins.readFile ./waybar.css;
  };

}
