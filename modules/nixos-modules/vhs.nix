{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.vhs.enable {
    environment.systemPackages = with pkgs; [
      vhs
    ];
  };
}
