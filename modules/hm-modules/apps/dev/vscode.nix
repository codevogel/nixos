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

      profiles.default = {
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
        extensions =
          with pkgs.vscode-extensions;
          [
            vscodevim.vim
          ]
          ++ lib.optionals osConfig.my.features.apps.dev.vscode.extensions.csharp.enable [
            csharpier.csharpier-vscode
            ms-dotnettools.csharp
            ms-dotnettools.csdevkit
            ms-dotnettools.vscode-dotnet-runtime
            ms-dotnettools.vscodeintellicode-csharp
          ]
          ++ lib.optionals osConfig.my.features.apps.dev.vscode.extensions.nix.enable [
            bbenoist.nix
          ]
          ++ lib.optionals osConfig.my.features.apps.dev.vscode.extensions.copilot.enable [
            github.copilot
            github.copilot-chat
          ]
          ++ lib.optionals osConfig.my.features.apps.dev.vscode.extensions.godot.enable [
            geequlim.godot-tools
          ]
          ++
            lib.optionals
              (
                osConfig.my.features.apps.dev.vscode.extensions.csharp.enable
                && osConfig.my.features.apps.dev.vscode.extensions.godot.enable
              )
              [
                woberg.godot-dotnet-tools
              ];
      };
    };
  };
}
