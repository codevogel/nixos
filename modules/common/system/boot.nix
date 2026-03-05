{
  lib,
  config,
  ...
}:

{
  options = {
    host-options.system.boot.enable = lib.mkEnableOption "Enable system.boot" // {
      default = config.host-options.system.enable;
    };
  };

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
