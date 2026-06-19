{
  lib,
  config,
  pkgs,
  ...
}:

let
  pinnedPkgs =
    import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/dd77db9265bc70cc04db61ee7f5be82a8c856926.tar.gz";
      sha256 = "sha256:17pqcr98y3m85bz19qqf1yf3pckd6w4zbm1k3z43511my49ihym9";
    }) {
      system = pkgs.system;
    };
in
{
  config = lib.mkIf config.my.features.apps.dev.vhs.enable {
    environment.systemPackages = with pinnedPkgs; [
      vhs
    ];
  };
}
