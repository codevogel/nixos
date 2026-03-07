{ ... }:

{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
    ../../modules/home-nest/default.nix
  ];

  my.features.apps.steam.enable = true;
}
