{
  lib,
  config,
  ...
}:

{
  options = {
    host-options.system.desktop-environment.enable =
      lib.mkEnableOption "Enable system.desktop-environment"
      // {
        default = true;
      };
  };

  imports = [
    ./audio.nix
    ./greeter.nix
    ./hyprland.nix
    ./keymap.nix
  ];
}
