{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.formatters.enable {
    environment.systemPackages = with pkgs; [
      prettier
      gdtoolkit_4
      markdownlint-cli2
    ];
  };
}
