{
  lib,
  config,
  ...
}:

{
  imports = [
    ./audio/default.nix
  ];

  options = {
    host-options.home-manager.desktop-environment.enable =
      lib.mkEnableOption "Enable home-manager.desktop-environment"
      // {
        default = config.host-options.home-manager.enable;
      };
  };

}
