{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.lazygit.enable {
    environment.systemPackages = with pkgs; [
      lazygit
    ];
  };
}
