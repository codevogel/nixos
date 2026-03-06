{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.bashly.enable {
    home.packages = with pkgs; [
      bashly
    ];
  };
}
