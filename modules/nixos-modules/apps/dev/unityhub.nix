{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.unityhub.enable {
    environment.systemPackages = with pkgs; [
      unityhub
    ];
  };
}
