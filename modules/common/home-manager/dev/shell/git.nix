{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.shell.git.enable {
    home.packages = with pkgs; [
      git
    ];
  };
}
