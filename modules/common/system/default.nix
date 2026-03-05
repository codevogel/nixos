{
  lib,
  ...
}:

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

  options = {
    host-options.system.enable = lib.mkEnableOption "Enable system" // {
      default = true;
    };
  };

}
