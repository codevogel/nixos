{ ... }:

{
  imports = [
    ./apps/dev/pls/pls.nix
    ./apps/dev/tmux/tmux.nix
    ./system/hyprland/waybar/waybar.nix
    ./apps/browser/firefox.nix
    ./apps/gazelle.nix
    ./apps/dev/git.nix
    ./system/hyprland/hyprland.nix
    ./apps/dev/kitty.nix
    ./system/hyprland/mako.nix
    ./apps/dev/oh-my-posh.nix
    ./system/hyprland/walker.nix
    ./apps/file-explorer/yazi.nix
    ./apps/dev/zsh.nix
  ];
}
