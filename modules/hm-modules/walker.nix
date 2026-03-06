{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.desktop-environment.launcher.walker.enable {
    programs.walker.enable = true;
  };
}
