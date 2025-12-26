{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mako
    libnotify
  ];

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 4000;
    };
  };
}
