# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ../../modules/system/boot.nix # Boot options (loader, kernel)
      ../../modules/system/networking.nix # Networking
      ../../modules/system/environment.nix # Environment (system packages, variables)
      ../../modules/system/users.nix # Users
      ../../modules/system/keymap.nix # Keymap (for x11)
      ../../modules/system/programs.nix # Nix program modules
      ../../modules/system/fonts.nix # Fonts
      ../../modules/system/locale.nix # Locale (time, internationalization)
      ../../modules/system/audio.nix # Audio
      ../../modules/system/nvidia.nix # Nvidia
      ../../modules/system/hyprland.nix # Hyprland

    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "codevogel" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
