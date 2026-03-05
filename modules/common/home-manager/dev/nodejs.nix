{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.dev.nodejs.enable = lib.mkEnableOption "Enable dev.nodejs" // {
      default = config.host-options.home-manager.dev.enable;
    };
  };

  config = lib.mkIf config.host-options.dev.nodejs.enable {
    home.packages = with pkgs; [
      nodejs
      pnpm
    ];
  };
}
