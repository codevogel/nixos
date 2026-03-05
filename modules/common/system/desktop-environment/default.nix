{
  lib,
  config,
  ...
}:

{
  imports = [
    ./audio.nix
    ./greeter.nix
    ./hyprland.nix
  ];

  options = {
    host-options.system.desktop-environment.enable =
      lib.mkEnableOption "Enable system.desktop-environment"
      // {
        default = true;
      };

  };

  config = lib.mkIf config.host-options.system.desktop-environment.enable {
    host-options.system.networking.enable = true;
    host-options.system.keymap.enable = true;
  };

}
