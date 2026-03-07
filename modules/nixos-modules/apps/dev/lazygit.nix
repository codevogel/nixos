{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.lazygit.enable {
    environment.systemPackages = with pkgs; [
      lazygit
    ];
  };
}
