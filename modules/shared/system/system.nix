{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ./boot.nix # Boot options (loader, kernel)
    ./networking.nix # Networking
    ./environment.nix # Environment (system packages, variables)
    ./users.nix # Users
    ./keymap.nix # Keymap (for x11)
    ./locale.nix # Locale (time, internationalization)
    ./audio.nix # Audio
    ./hyprland.nix # Hyprland
    ./theme/theme.nix # Stylix theming
    ./greeter.nix # Greeter
    ./home-manager.nix # Home Manager
    ./nvidia.nix # Nvidia
    ./steam.nix
  ];
}
