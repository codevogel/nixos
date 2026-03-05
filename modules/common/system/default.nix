{ ... }:

{
  imports = [
    ./desktop-environment/default.nix
    ./boot.nix
    ./home-manager.nix
    ./users.nix
  ];
}
