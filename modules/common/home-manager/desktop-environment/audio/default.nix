{
  lib,
  config,
  ...
}:

{
  imports = [
    ./pamixer.nix
    ./wiremix.nix
  ];

  options = {
    host-options.home-manager.desktop-environment.audio.enable =
      lib.mkEnableOption "Enable home-manager.desktop-environment.audio"
      // {
        default = config.host-options.home-manager.desktop-environment.enable;
      };
  };

}
