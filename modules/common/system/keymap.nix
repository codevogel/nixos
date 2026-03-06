{
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.host-options.system.keymap.enable {
    # Set keymap for x11
    services.xserver.xkb = {
      layout = "us";
      variant = "euro";
    };
  };
}
