{
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.host-options.system.boot.enable {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      # Defaults to LTS kernel if not set
      # kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
