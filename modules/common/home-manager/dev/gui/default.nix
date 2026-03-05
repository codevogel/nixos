{
  lib,
  config,
  ...
}:

{
  imports = [
    ./blender.nix
    ./godot.nix
    ./unityhub.nix
    ./vscode.nix
  ];

  options = {
    host-options.home-manager.dev.gui.enable = lib.mkEnableOption "Enable home-manager.dev.gui" // {
      default = config.host-options.home-manager.dev.enable;
    };
  };

}
