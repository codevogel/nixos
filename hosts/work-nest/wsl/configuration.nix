{ inputs, lib, ... }:

{
  imports = [
    ../../common.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  host-options.system.boot.enable = false;
  host-options.system.desktop-environment.enable = false;

  wsl.enable = true;
  wsl.defaultUser = "codevogel";
}
