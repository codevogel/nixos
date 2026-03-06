{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.formatters-and-linters.enable {
    home.packages = with pkgs; [
      prettier
      gdtoolkit_4
      markdownlint-cli2
    ];
  };
}
