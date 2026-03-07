{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.vscode.enable {
    environment.systemPackages = with pkgs; [
      vscode
    ];
  };
}
