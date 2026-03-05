{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.dev.bashly.enable = lib.mkEnableOption "Enable dev.bashly" // {
      default = config.host-options.home-manager.dev.enable;
    };
  };

  config = lib.mkIf config.host-options.dev.bashly.enable {
    home.packages = with pkgs; [
      bashly
    ];
  };
}
