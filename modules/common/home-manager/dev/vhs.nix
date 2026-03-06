{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.vhs.enable {
    home.packages = with pkgs; [
      vhs
    ];
  };
}
