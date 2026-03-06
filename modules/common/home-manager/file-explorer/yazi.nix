{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.file-explorer.yazi.enable {
    home.packages = with pkgs; [
      yazi
    ];
  };
}
