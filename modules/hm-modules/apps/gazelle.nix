{
  lib,
  osConfig,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.gazelle.homeModules.gazelle
  ];

  config = lib.mkIf osConfig.my.features.apps.gazelle.enable {
    home.packages = [
      inputs.gazelle.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    programs.gazelle = {
      enable = true;
    };
  };
}
