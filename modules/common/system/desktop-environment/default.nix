{
  lib,
  config,
  ...
}:

{
  imports = [
    ./games/default.nix
    ./audio.nix
    ./greeter.nix
    ./hyprland.nix
  ];

  config = lib.mkIf config.host-options.system.desktop-environment.enable {
    host-options.system.networking.enable = true;
    host-options.system.keymap.enable = true;
    host-options.system.gpu.enable = true;
  };

}
