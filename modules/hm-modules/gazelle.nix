{
  lib,
  osConfig,
  pkgs,
  inputs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.networking.gazelle.enable {
    home.packages = [
      inputs.gazelle.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    programs.gazelle = {
      enable = true;
    };
  };
}
