{ inputs, lib, ... }:

{
  imports = [
    ../../common.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  wsl.enable = true;
  wsl.defaultUser = "codevogel";

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  my.features = {
    profiles = {
      desktop.enable = false;
      wsl.enable = true;
    };

    system = {
      boot.enable = false;
      networking.enable = false;
    };
  };

}
