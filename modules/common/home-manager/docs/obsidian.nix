{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.docs.obsidian.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
