{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf osConfig.host-options.home-manager.desktop-environment.terminal-emulator.kitty.enable
      {
        home.packages = with pkgs; [
          kitty
        ];
      };
}
