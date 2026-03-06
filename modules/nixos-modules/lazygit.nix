{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.shell.lazygit.enable {
    environment.systemPackages = with pkgs; [
      lazygit
    ];
  };
}
