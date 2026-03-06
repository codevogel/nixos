{
  lib,
  osConfig,
  inputs,
  ...
}:

{
  options = {
    host-options.home-manager.enable = lib.mkEnableOption "Enable home-manager" // {
      # NOTE: This defaults to the value of config.system.home-manager.enable,
      # so that if the user disables home-manager at the system level,
      # it will also be disabled at the home-manager level
      default = osConfig.host-options.system.home-manager.enable;
    };
  };

  imports = [
    inputs.walker.homeManagerModules.default
    inputs.gazelle.homeModules.gazelle
    ./desktop-environment/default.nix
    ./dev/default.nix
  ];
}
