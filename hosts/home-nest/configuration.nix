{ pkgs, lib, ... }:

{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
  ];

  my.features.apps.steam.enable = true;
  my.features.system.nvidia.enable = true;
  my.features.system.bluetooth.enable = false;

  hardware.nvidia.open = true;

  boot.loader.systemd-boot.extraEntries."windows.conf" = ''
    title Windows 11
    efi /EFI/Microsoft/Boot/bootmgfw.efi
  '';

  users.users.codevogel = {
    extraGroups = [ "camera" ];
  };

  home-manager.users.codevogel = {
    home.file.".config/hypr/codevogel/monitors.lua" = lib.mkForce {
      text = ''
        hl.monitor({
        	output = "DP-3",
        	mode = "3440x1440@143.97",
        	position = "0x0",
        	scale = 1,
        })
      '';
    };

  };

  programs.gphoto2.enable = true;
  services.gvfs.enable = true;
  security.polkit.enable = true;

  environment.systemPackages = [ pkgs.darktable ];

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
