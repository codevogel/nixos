{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.home-manager.desktop-environment.audio.pamixer.enable =
      lib.mkEnableOption "Enable home-manager.desktop-environment.audio.pamixer"
      // {
        default = config.host-options.home-manager.desktop-environment.audio.enable;
      };
  };

  config = lib.mkIf config.host-options.home-manager.desktop-environment.audio.pamixer.enable {
    home.packages = with pkgs; [
      pamixer
    ];
  };
}
