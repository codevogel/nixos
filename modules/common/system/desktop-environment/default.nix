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

  options = {
    host-options.system.desktop-environment.enable =
      lib.mkEnableOption "Enable system.desktop-environment"
      // {
        default = config.host-options.system.enable;
      };

  };

  config = lib.mkIf config.host-options.system.desktop-environment.enable {
    host-options.system.networking.enable = true;
    host-options.system.keymap.enable = true;
    host-options.system.gpu.enable = true;
  };

}
