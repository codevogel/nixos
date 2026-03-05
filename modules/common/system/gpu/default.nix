{
  lib,
  config,
  ...
}:

{
  imports = [
    ./nvidia.nix
  ];

  options = {
    host-options.system.gpu.enable = lib.mkEnableOption "Enable system.gpu" // {
      default = config.host-options.system.enable;
    };
  };
}
