{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.nodejs.enable {
    environment.systemPackages = with pkgs; [
      nodejs
      pnpm
    ];
  };
}
