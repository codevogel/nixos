{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.shell.oh-my-posh.enable {
    home.packages = with pkgs; [
      oh-my-posh
    ];
  };
}
