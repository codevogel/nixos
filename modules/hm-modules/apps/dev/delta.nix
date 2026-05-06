{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.delta.enable {
    programs.delta = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
