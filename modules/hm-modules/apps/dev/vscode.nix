{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.vscode.enable {
    programs.vscode = {
      enable = true;
    };
  };
}
