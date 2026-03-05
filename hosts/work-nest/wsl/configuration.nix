{ inputs, lib, ... }:

{
  imports = [
    ../../common.nix
    inputs.nixos-wsl.nixosModules.default
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  wsl.enable = true;
  wsl.defaultUser = "codevogel";

  host-options = {
    system = {
      boot.enable = false;
      networking.enable = false;
      desktop-environment = {
        enable = false;
      };
    };
    home-manager = {
      dev.gui.enable = false;
    };
  };

}
