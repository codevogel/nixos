{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.my.features.system.nix-ld.enable {
    programs.nix-ld = {
      enable = true;
      libraries = lib.optionals config.my.features.apps.dev.vscode.extensions.csharp.enable (
        with pkgs;
        [
          stdenv.cc.cc.lib
          zlib
          openssl
          icu
        ]
      );
    };
  };
}
