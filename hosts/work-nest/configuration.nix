{ lib, config, pkgs, ... }:

{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
  ];

  my.features.system.hyprland.waybar.laptopModules.enable = true;
  my.features.system.nvidia.enable = true;

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  stylix = {
    fonts = {
      sizes.applications = 10;
    };
  };

  home-manager.users."codevogel" =
    { lib, pkgs, ... }:
    {
    wayland.windowManager.hyprland = {
      settings = {
        monitor = [
          "eDP-1, 1920x1200, auto, 1"
          "DP-2, 1920x1080, 0x0, 1"
        ];
        input = {
          kb_options = "ctrl:nocaps";
        };
      };
    };

    # Unity 6000.6+ UnityShaderCompiler links libdxcompiler.so, which NEEDS
    # libtinfo.so.6 via RUNPATH $ORIGIN/../lib (Editor/Data/lib), a dir the
    # Unity Editor download doesn't ship. RUNPATH is resolved by the dynamic
    # loader independent of LD_LIBRARY_PATH/env, so symlink it in directly.
    # See: https://github.com/NixOS/nixpkgs/issues/561247
    home.activation.unityShaderCompilerLibtinfoFix = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      shopt -s nullglob
      for tools in "$HOME"/Unity/Hub/Editor/*/Editor/Data/Tools; do
        libDir="$tools/../lib"
        run mkdir -p "$libDir"
        run ln -sf "${pkgs.ncurses}/lib/libtinfo.so.6" "$libDir/libtinfo.so.6"
      done
    '';

    home.file.".config/hypr/codevogel/monitors.lua" = {
      text = lib.mkForce ''
        hl.monitor({
          output = "eDP-1",
          mode = "preferred",
          position = "1920x0",
          scale = 1.2,
        })
        hl.monitor({
          output = "DP-1",
          mode = "preferred",
          position = "0x0",
          scale = 1,
        })
      '';
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
