{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.dev.gui.vscode.enable = lib.mkEnableOption "Enable dev.gui.vscode" // {
      default = config.host-options.home-manager.dev.gui.enable;
    };
  };

  config = lib.mkIf config.host-options.dev.gui.vscode.enable {
    home.packages = with pkgs; [
      vscode
    ];
  };
}
