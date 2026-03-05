{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.dev.vhs.enable = lib.mkEnableOption "Enable dev.vhs" // {
      default = config.host-options.home-manager.dev.enable;
    };
  };

  config = lib.mkIf config.host-options.dev.vhs.enable {
    home.packages = with pkgs; [
      vhs
    ];
  };
}
