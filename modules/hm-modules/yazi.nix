{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.file-explorer.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "yy";
    };
  };
}
