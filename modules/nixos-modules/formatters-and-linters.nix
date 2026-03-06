{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.formatters-and-linters.enable {
    environment.systemPackages = with pkgs; [
      prettier
      gdtoolkit_4
      markdownlint-cli2
    ];
  };
}
