{
  lib,
  config,
  ...
}:

{
  options = {
    host-options.system.desktop-environment.keymap.enable =
      lib.mkEnableOption "Enable desktop-environment.keymap"
      // {
        default = config.host-options.system.desktop-environment.enable;
      };
  };

  config = lib.mkIf config.host-options.system.desktop-environment.keymap.enable {
    # Set keymap for x11
    services.xserver.xkb = {
      layout = "us";
      variant = "euro";
    };
  };
}
