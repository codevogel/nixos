{ ... }:

{
  imports = [
    ./waybar.nix
  ];

  # Hint electron apps to use WL
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$browser" = "firefox";
      "exec-once" = "waybar";
      bind = [
        # Close windows
        "$mainMod SHIFT, C, killactive"

        # Quit Hyprland
        "$mainMod SHIFT, Q, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"

        # Launch programs
        "$mainMod, Return, exec, $terminal"
        "$mainMod, B, exec, $browser"
        "$mainMod, M, exec, spotify"

        # Cycle through workspaces with mouse wheel
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Enter submaps
        "$mainMod, W, submap, move_focus"
        "$mainMod SHIFT, W, submap, resize_windows"
      ]
      ++ (
        # workspaces
        # binds $mod + [ shift +] {1..5} to [move to] workspace {1..5}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mainMod, code:1${toString i}, workspace, ${toString ws}"
              "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 5
        )
      );
    };
    submaps = {
      move_focus = {
        settings = {
          bind = [
            ", h, movefocus, l"
            ", j, movefocus, d"
            ", k, movefocus, u"
            ", l, movefocus, r"

            ", escape, submap, reset"
          ];
        };
      };
      resize_windows = {
        settings = {
          bind = [
            ", h, resizeactive, -100 0"
            ", j, resizeactive, 0 -100"
            ", k, resizeactive, 0 100"
            ", l, resizeactive, 100 0"

            ", escape, submap, reset"
          ];
        };
      };
    };
  };
}
