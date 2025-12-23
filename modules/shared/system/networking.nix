{ lib, ... }:

{
  networking = {
    hostName = lib.mkDefault "nest"; # Define your hostname.
    networkmanager.enable = true; # Enable networking
  };
}
