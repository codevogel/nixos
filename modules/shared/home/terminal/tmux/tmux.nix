{ pkgs, ... }:

{
  home.packages = [
    pkgs.tmux
  ];

  programs.tmux = {
    enable = true;
    baseIndex = 1;
  };
}
