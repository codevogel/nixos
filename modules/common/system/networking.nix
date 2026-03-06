{
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.host-options.system.networking.enable {
    networking = {
      hostName = lib.mkDefault "nest"; # Define your hostname.
      networkmanager.enable = true; # Enable networking
    };
  };
}
