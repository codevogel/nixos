{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf osConfig.my.features.apps.fileExplorer.nautilus.enable
      {
        environment.systemPackages = with pkgs; [
          nautilus
        ];
      };
}
