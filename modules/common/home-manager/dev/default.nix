{ ... }:

{
  imports = [
    ./gui/default.nix
    ./pls/pls.nix
    ./shell/default.nix
    ./bashly.nix
    ./dotnet.nix
    ./formatters-and-linters.nix
    ./nodejs.nix
    ./vhs.nix
  ];
}
