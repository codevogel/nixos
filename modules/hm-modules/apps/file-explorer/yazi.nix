{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.fileExplorer.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "yy";
    };
  };
}
