{
  lib,
  config,
  ...
}:

{
  imports = [
    ./gui/default.nix
    ./pls/pls.nix
    ./bashly.nix
    ./dotnet.nix
    ./formatters-and-linters.nix
    ./nodejs.nix
    ./vhs.nix
  ];

  options = {
    host-options.home-manager.dev.enable = lib.mkEnableOption "Enable home-manager.dev" // {
      default = config.host-options.home-manager.enable;
    };
  };

}
