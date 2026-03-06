{ inputs, ... }:

{
  imports = [
    inputs.walker.homeManagerModules.default
    inputs.gazelle.homeModules.gazelle
    ./desktop-environment/default.nix
    ./dev/default.nix
    ./docs/default.nix
    ./downloader/default.nix
  ];
}
