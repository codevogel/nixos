{ lib, ... }:

{
  networking.networkmanager.enable = true;

  networking.hostName = lib.mkForce "home-nest"; # Define your hostname.

  networking.networkmanager.ensureProfiles.profiles = {
    wired-enp34s0 = {
      connection = {
        id = "Wired connection 1";
        type = "802-3-ethernet";
        interface-name = "enp34s0";
        autoconnect = true;
      };

      ethernet = {
        auto-negotiate = true;
        speed = 1000;
        duplex = "full";
      };

      ipv4 = {
        method = "auto";
      };

      ipv6 = {
        method = "auto";
      };
    };
  };
}
