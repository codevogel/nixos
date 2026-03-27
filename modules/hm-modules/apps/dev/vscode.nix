{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.vscode.enable {
    programs.vscode = {
      enable = true;

      profiles.default.extensions =
        with pkgs.vscode-extensions;
        [
          vscodevim.vim
        ]
        ++ lib.optionals osConfig.my.features.apps.dev.vscode.extensions.csharp.enable [
          csharpier.csharpier-vscode
          ms-dotnettools.csharp
        ];
    };

    programs.nix-ld.libraries =
      lib.optionals osConfig.my.features.apps.dev.vscode.extensions.csharp.enable
        (
          with pkgs;
          [
            stdenv.cc.cc.lib
            zlib
            openssl
            icu
          ]
        );
  };
}
