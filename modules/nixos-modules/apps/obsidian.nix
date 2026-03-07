{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.obsidian.enable {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
}
