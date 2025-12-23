{ lib, ... }:

{
  networking = {
    hostName = lib.mkForce "home-nest"; # Define your hostname.
  };
}
