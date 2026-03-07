{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.bashly.enable {
    environment.systemPackages = with pkgs; [
      bashly
    ];
  };
}
