{ ... }:

{
  imports = [
    ./desktop-environment/default.nix
    ./gpu/default.nix
    ./theme/default.nix
    ./boot.nix
    ./home-manager.nix
    ./keymap.nix
    ./locale.nix
    ./neovim.nix
    ./networking.nix
    ./sops.nix
    ./users.nix
  ];
}
