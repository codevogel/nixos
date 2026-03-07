{
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.my.features.system.networking.enable {
    networking = {
      hostName = lib.mkDefault "nest"; # Define your hostname.
      networkmanager.enable = true; # Enable networking
    };
  };
}
