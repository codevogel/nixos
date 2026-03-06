{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.gui.vscode.enable {
    home.packages = with pkgs; [
      vscode
    ];
  };
}
