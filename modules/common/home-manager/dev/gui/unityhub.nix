{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.dev.gui.unityhub.enable = lib.mkEnableOption "Enable dev.gui.unityhub" // {
      default = config.host-options.home-manager.dev.gui.enable;
    };
  };

  config = lib.mkIf config.host-options.dev.gui.unityhub.enable {
    home.packages = with pkgs; [
      unityhub
    ];
  };
}
