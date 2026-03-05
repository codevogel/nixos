{
  lib,
  ...
}:

{
  imports = [
    ./steam.nix
  ];

  options = {
    host-options.system.games.enable = lib.mkEnableOption "Enable system.games" // {
      default = true;
    };
  };

}
