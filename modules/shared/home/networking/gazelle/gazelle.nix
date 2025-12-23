{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.gazelle.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.gazelle = {
    enable = true;
  };
}
