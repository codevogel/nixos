{
  lib,
  config,
  inputs,
  ...
}:

{
  options = {
    host-options.home-manager.enable = lib.mkEnableOption "Enable home-manager" // {
      default = config.system.home-manager.enable;
    };
  };

  imports = [
    inputs.walker.homeManagerModules.default
    inputs.gazelle.homeModules.gazelle
  ];
}
