{
  lib,
  osConfig,
  ...
}:

{
  config =
    lib.mkIf osConfig.host-options.home-manager.desktop-environment.terminal-emulator.kitty.enable
      {
        programs.kitty = {
          enable = true;
        };
      };
}
