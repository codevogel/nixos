{
  lib,
  config,
  ...
}:

{
  options = {
    host-options.desktop-environment.enable = lib.mkEnableOption "Enable desktop-environment" // {
      default = true;
    };
  };

  imports = [
    ./audio.nix
    ./greeter.nix
    ./hyprland.nix
    ./keymap.nix
  ];

  config = lib.mkIf config.host-options.desktop-environment.enable {
    host-options.boot.enable = lib.mkForce true;
  };
}
