{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.nodejs.enable {
    home.packages = with pkgs; [
      nodejs
      pnpm
    ];
  };
}
