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
          settings = {
            # Otherwise kitty restores a cached maximized state, which breaks tiling
            remember_window_size = "no";
          };
        };
      };
}
