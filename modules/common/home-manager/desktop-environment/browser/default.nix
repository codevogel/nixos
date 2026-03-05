{
  lib,
  config,
  ...
}:

{
  imports = [
    ./ungoogled-chromium/ungoogled-chromium.nix
    ./firefox.nix
  ];

  options = {
    host-options.home-manager.desktop-environment.browser.enable =
      lib.mkEnableOption "Enable home-manager.desktop-environment.browser"
      // {
        default = config.host-options.home-manager.desktop-environment.enable;
      };
  };

}
