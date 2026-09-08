{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.unityhub.enable {
    environment.systemPackages = [
      (pkgs.unityhub.override {
        extraLibs = pkgs: [ pkgs.ncurses ];
      })
    ];
  };
}
