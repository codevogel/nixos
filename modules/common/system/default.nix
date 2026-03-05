{ ... }:

{
  imports = [
    ./desktop-environment/default.nix
    ./boot.nix
    ./home-manager.nix
    ./locale.nix
    ./users.nix
  ];
}
