{ lib, config, ... }:

let
  cfg = config.host-options;
  inherit (import ./../helpers/lib-mk-helpers.nix { inherit lib; }) mkCascadingEnable mkOptionsTree;

  features = {
    system = {
      boot = { };
      sops = { };
      keymap = { };
      locale = { };
      neovim = { };
      networking = { };
      users = { };

      home-manager.stateVersion = lib.mkOption {
        type = lib.types.str;
        default = "25.11";
        description = "Home Manager state version.";
      };

      gpu.nvidia = { };

      desktop-environment = {
        audio = { };
        hyprland = { };
        greeter = { };

        games.steam = { };
      };

      theme.stylix = { };
    };

    home-manager = {
      desktop-environment = {
        audio = {
          pamixer = { };
          wiremix = { };
        };

        browser = {
          firefox = { };
          ungoogled-chromium = { };
        };

        file-explorer = {
          nautilus = { };
        };

        launcher = {
          walker = { };
        };

        media-player = {
          playerctl = { };
          vlc = { };
          spotify = { };
        };

        recording = {
          obs-studio = { };
        };

        terminal-emulator = {
          kitty = { };
        };

        wm = {
          hyprland = {
            waybar = {
              laptop-modules = lib.mkOption {
                type = lib.types.bool;
                default = false;
                description = "Whether to enable laptop modules (battery, backlight, bluetooth).";
              };
            };
            settings.monitor = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              default = [ ];
              description = "List of monitors to configure.";
            };
          };
        };
      };

      dev = {
        gui = {
          blender = { };
          godot = { };
          unityhub = { };
          vscode = { };
        };

        pls = { };

        shell = {
          tmux = { };
          git = { };
          lazygit = { };
          oh-my-posh = { };
          zsh = { };
        };

        bashly = { };
        dotnet = { };
        formatters-and-linters = { };
        nodejs = { };
        vhs = { };
      };

      docs = {
        obsidian = { };
      };

      downloader = {
        qbittorrent = { };
      };

      file-explorer = {
        yazi = { };
      };

      networking = {
        gazelle = { };
      };

    };
  };
in
{
  options.host-options = mkOptionsTree mkCascadingEnable { enable = true; } cfg features;
}
