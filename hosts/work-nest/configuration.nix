{ lib, config, ... }:

{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
  ];

  my.features.system.hyprland.waybar.laptopModules.enable = true;

  stylix = {
    fonts = {
      sizes.applications = 10;
    };
  };

  networking = {
    hostName = lib.mkForce "work-nest";
    networkmanager = {
      # Enabled by my.features.system.networking.enable, but we need to set the profiles here.
      ensureProfiles = {
        environmentFiles = [ config.sops.templates.eduroam-env.path ];
        profiles = {
          eduroam = {
            connection = {
              id = "eduroam";
              type = "wifi";
              interface-name = "wlp0s20f3";
            };
            wifi = {
              mode = "infrastructure";
              ssid = "eduroam";
            };
            wifi-security = {
              key-mgmt = "wpa-eap";
            };
            "802-1x" = {
              eap = "tls";
              identity = "$EDUROAM_IDENTITY";
              client-cert = "/etc/ssl/certs/eduroam/cert.pem";
              private-key = "/etc/ssl/certs/eduroam/private.key";
              private-key-password = "$EDUROAM_CERT_PASSWORD";
              ca-cert = "/etc/ssl/certs/ca-bundle.crt";
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
  };

  sops = {
    secrets = {
      eduroam-identity = { };
      eduroam-cert-password = { };
    };
    templates.eduroam-env.content = ''
      EDUROAM_IDENTITY=${config.sops.placeholder.eduroam-identity}
      EDUROAM_CERT_PASSWORD=${config.sops.placeholder.eduroam-cert-password}
    '';
  };
}
