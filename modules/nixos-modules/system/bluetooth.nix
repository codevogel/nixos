{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.system.bluetooth.enable {
    environment.systemPackages = with pkgs; [
      bluetui
    ];

    hardware.bluetooth.enable = true;
  };
}
