{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.docs.obsidian.enable {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
}
