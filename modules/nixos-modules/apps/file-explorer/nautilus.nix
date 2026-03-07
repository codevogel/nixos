{
  lib,
  config,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf config.my.features.apps.fileExplorer.nautilus.enable
      {
        environment.systemPackages = with pkgs; [
          nautilus
        ];
      };
}
