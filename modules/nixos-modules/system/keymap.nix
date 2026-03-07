{
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.my.features.system.keymap.enable {
    # Set keymap for x11
    services.xserver.xkb = {
      layout = "us";
      variant = "euro";
    };
  };
}
