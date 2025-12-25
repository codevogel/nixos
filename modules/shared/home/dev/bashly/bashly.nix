{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bashly
  ];
}
