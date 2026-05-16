{
  lib,
  config,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.profiles.desktop.enable {
    gtk.gtk4.theme = config.gtk.theme;
  };
}
