{
  lib,
  osConfig,
  ...
}:

{
  config =
    lib.mkIf osConfig.my.features.apps.dev.kitty.enable
      {
        programs.kitty = {
          enable = true;
        };
      };
}
