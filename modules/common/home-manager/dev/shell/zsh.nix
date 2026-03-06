{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.shell.zsh.enable {
    home.packages = with pkgs; [
      zsh
    ];
  };
}
