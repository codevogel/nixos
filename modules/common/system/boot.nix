{
  # pkgs,
  ...
}:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Defaults to LTS kernel if not set
    # kernelPackages = pkgs.linuxPackages_latest;
  };
}
