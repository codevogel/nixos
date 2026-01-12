{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    prefix = "C-s";
    mouse = true;

    baseIndex = 1;
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = kanagawa;
        extraConfig = ''
          set -g @kanagawa-override-theme 'kanagawa'
          set -g @kanagawa-show-powerline true
          set -g @kanagawa-plugins "git time"
          set -g @kanagawa-show-edge-icons true
          set -g @kanagawa-border-contrast true
          set -g @kanagawa-ignore-window-colors true
          set -g @kanagawa-show-left-icon session
          set -g @kanagawa-show-location false
        '';
      }
    ];

    extraConfig = ''
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set-option -g status-position top
    '';
  };
}
