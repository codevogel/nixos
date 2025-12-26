{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    ffmpeg
    wf-recorder
  ];
}
