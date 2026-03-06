{
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.host-options.system.desktop-environment.bluetooth.enable {
    hardware.bluetooth.enable = true;
    host-options.home-manager.desktop-environment.bluetooth.bluetui.enable = true;
  };
}
