{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.formatters.enable {
    environment.systemPackages = with pkgs; [
      prettier
      gdtoolkit_4
      markdownlint-cli2
    ];
  };
}
