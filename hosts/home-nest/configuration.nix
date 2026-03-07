{ ... }:

{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
  ];

  my.features.apps.steam.enable = true;
}
