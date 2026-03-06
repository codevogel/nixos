{ ... }:

{
  imports = [
    ./desktop-environment/default.nix
    ./gpu/default.nix
    ./boot.nix
    ./home-manager.nix
    ./keymap.nix
    ./locale.nix
    ./networking.nix
    ./sops.nix
    ./users.nix
  ];
}
