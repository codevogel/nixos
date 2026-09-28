{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.system.boot.enable {
    boot = {
      loader = {
        # Seconds before the selected entry boots automatically
        timeout = 5;

        limine = {
          enable = true;
          efiSupport = true;
          # Preselect the last booted entry
          extraConfig = ''
            remember_last_entry: yes
          '';
          # Rebuilds add a new generation entry, so forget the remembered
          # (old) generation to fall back to the newest one.
          extraInstallCommands = ''
            for var in /sys/firmware/efi/efivars/LimineLastBootedEntry-*; do
              [ -e "$var" ] || continue
              ${pkgs.e2fsprogs}/bin/chattr -i "$var" 2>/dev/null || true
              ${pkgs.coreutils}/bin/rm -f "$var" || true
            done
          '';
        };

        efi.canTouchEfiVariables = true;
      };

      # Defaults to LTS kernel if not set
      # kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
