{
  lib,
  config,
  ...
}:

{
  options = {
    host-options.boot.enable = lib.mkEnableOption "Enable boot" // {
      default = false;
    };
  };

  config = lib.mkIf config.host-options.boot.enable {
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
