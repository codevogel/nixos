{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.formatters.enable {
    environment.systemPackages =
      with pkgs;
      [
        prettier
        markdownlint-cli2
      ]
      ++ lib.optionals config.my.features.apps.dev.godot.enable [
        gdtoolkit_4
      ]
      ++ lib.optionals config.my.features.apps.dev.dotnet.enable [
        csharpier
      ];
  };
}
