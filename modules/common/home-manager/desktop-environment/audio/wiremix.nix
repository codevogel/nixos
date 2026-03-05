{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.home-manager.desktop-environment.audio.wiremix.enable =
      lib.mkEnableOption "Enable home-manager.desktop-environment.audio.wiremix"
      // {
        default = config.host-options.home-manager.desktop-environment.audio.enable;
      };
  };

  config = lib.mkIf config.host-options.home-manager.desktop-environment.audio.wiremix.enable {
    home.packages = with pkgs; [
      wiremix
    ];
  };
}
