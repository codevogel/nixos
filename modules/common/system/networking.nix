{
  lib,
  config,
  ...
}:

{
  options = {
    host-options.system.networking.enable = lib.mkEnableOption "Enable system.networking" // {
      default = config.host-options.system.enable;
    };
  };

  config = lib.mkIf config.host-options.system.networking.enable {
    networking = {
      hostName = lib.mkDefault "nest"; # Define your hostname.
      networkmanager.enable = true; # Enable networking
    };
  };
}
