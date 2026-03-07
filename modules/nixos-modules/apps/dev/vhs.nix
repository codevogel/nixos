{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.vhs.enable {
    environment.systemPackages = with pkgs; [
      vhs
    ];
  };
}
