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
    };

    home-manager = {
      dev = {
        bashly = { };
        dotnet = { };
        formatters-and-linters = { };
        nodejs = { };
        vhs = { };
        pls = { };

        gui = {
          blender = { };
          godot = { };
          unityhub = { };
          vscode = { };
        };
      };

      desktop-environment = {
        audio = {
          pamixer = { };
          wiremix = { };
        };

        browser = {
          firefox = { };
          ungoogled-chromium = { };
        };
      };
    };
  };
in
{
  options.host-options = mkOptionsTree mkCascadingEnable { enable = true; } cfg features;
}
