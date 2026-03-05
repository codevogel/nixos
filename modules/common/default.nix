{
  ...
}:

{
  imports = [
    ./system/default.nix
    # We don't need to include ./mnw/default.nix here, as it's imported through the flake's outputs
    # We don't need to include ./home-manager/default.nix here, as it's imported through ./system/home-manager.nix
  ];
}
