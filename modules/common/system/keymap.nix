{
  lib,
  config,
  ...
}:

{
  options = {
    host-options.system.keymap.enable = lib.mkEnableOption "Enable system.keymap" // {
      default = config.host-options.system.enable;
    };
  };

  config = lib.mkIf config.host-options.system.keymap.enable {
    # Set keymap for x11
    services.xserver.xkb = {
      layout = "us";
      variant = "euro";
    };
  };
}
