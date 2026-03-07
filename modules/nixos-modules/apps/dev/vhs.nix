{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.vhs.enable {
    environment.systemPackages = with pkgs; [
      vhs
    ];
  };
}
