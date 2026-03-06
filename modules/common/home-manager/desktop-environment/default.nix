{
  lib,
  osConfig,
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
        # NOTE: This defaults to the value of config.system.desktop-environment.enable,
        # so that if the user disables the desktop environment at the system level,
        # it will also be disabled at the home-manager level
        default = osConfig.host-options.system.desktop-environment.enable;
      };
  };

}
