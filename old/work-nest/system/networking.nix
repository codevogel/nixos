{ lib, config, ... }:

{
  networking = {
    hostName = lib.mkForce "work-nest"; # Define your hostname.
  };

  # This is the actual specification of the secrets.
  sops.secrets.eduroam-identity = { };
  sops.secrets.eduroam-cert-password = { };

  sops.templates.eduroam-env.content = ''
    EDUROAM_IDENTITY=${config.sops.placeholder.eduroam-identity}
    EDUROAM_CERT_PASSWORD=${config.sops.placeholder.eduroam-cert-password}
  '';

  networking.networkmanager.enable = true;

  networking.networkmanager.ensureProfiles.environmentFiles = [
    config.sops.templates.eduroam-env.path
  ];

  networking.networkmanager.ensureProfiles.profiles = {
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
        key-mgmt = "wpa-eap"; # # adapt according to your universities setup
      };
      "802-1x" = {
        # # not all or even some additional values may be needed here according to your institution
        eap = "tls"; # # adapt according to your universities setup
        identity = "$EDUROAM_IDENTITY";
        client-cert = "/etc/ssl/certs/eduroam/cert.pem";
        private-key = "/etc/ssl/certs/eduroam/private.key";
        private-key-password = "$EDUROAM_CERT_PASSWORD"; # # warning, this should only be done for testing purposes, as it makes the password world-readable. You should replace this with some form of secrets-management using sops-nix or agenix.
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
}
