{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.bashly.enable {
    environment.systemPackages = with pkgs; [
      bashly
    ];
  };
}
