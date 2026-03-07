{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.obsidian.enable {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
}
