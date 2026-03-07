{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.vscode.enable {
    environment.systemPackages = with pkgs; [
      vscode
    ];
  };
}
