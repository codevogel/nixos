{ lib, ... }:

{
  networking = {
    hostName = lib.mkForce "work-nest"; # Define your hostname.
  };
}
