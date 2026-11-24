{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.docker.enable {
    programs.lazydocker.enable = true;
  };
}
