{ ... }:

{
  # Set keymap for x11
  services.xserver.xkb = {
    layout = "us";
    variant = "euro";
  };
}
