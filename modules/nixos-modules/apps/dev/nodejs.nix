{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.nodejs.enable {
    environment.systemPackages = with pkgs; [
      nodejs
      pnpm
    ];
  };
}
