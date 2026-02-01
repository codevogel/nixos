{ pkgs, ... }:

{
  home.packages = with pkgs; [
    godotPackages_4_6.godot
  ];
}
