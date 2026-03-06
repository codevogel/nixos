{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.nodejs.enable {
    environment.systemPackages = with pkgs; [
      nodejs
      pnpm
    ];
  };
}
