{ ... }:

{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
  ];

  my.features.apps.steam.enable = true;
  my.features.system.nvidia.enable = true;
  my.features.system.bluetooth.enable = false;

  hardware.nvidia.open = true;

  networking = {
    hostName = "home-nest";
    networkmanager = {
      # Enabled by my.features.system.networking.enable, but we need to set the profiles here.
      ensureProfiles.profiles = {
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
    };
  };

}
