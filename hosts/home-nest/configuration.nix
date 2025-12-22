# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ self, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/common/system/boot.nix # Boot options (loader, kernel)
    ../../modules/common/system/networking.nix # Networking
    ../../modules/common/system/environment.nix # Environment (system packages, variables)
    ../../modules/common/system/users.nix # Users
    ../../modules/common/system/keymap.nix # Keymap (for x11)
    ../../modules/common/system/locale.nix # Locale (time, internationalization)
    ../../modules/common/system/audio.nix # Audio
    ../../modules/common/system/nvidia.nix # Nvidia
    ../../modules/common/system/hyprland.nix # Hyprland
    ../../modules/common/system/theme/theme.nix # Stylix theming
    ../../modules/common/system/greeter.nix # Greeter

  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit self inputs; };
    users = {
      "codevogel" = {
        imports = [
          ./home.nix
          inputs.walker.homeManagerModules.default
        ];
      };
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
