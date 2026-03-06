{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf osConfig.host-options.home-manager.desktop-environment.file-explorer.nautilus.enable
      {
        home.packages = with pkgs; [
          nautilus
        ];
      };
}
