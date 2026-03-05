{
  lib,
  config,
  ...
}:

{
  imports = [
    ./steam.nix
  ];

  options = {
    host-options.system.desktop-environment.games.enable =
      lib.mkEnableOption "Enable system.desktop-environment.games"
      // {
        default = config.host-options.system.desktop-environment.enable;
      };
  };

}
