{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.dev.formatters-and-linters.enable =
      lib.mkEnableOption "Enable dev.formatters-and-linters"
      // {
        default = config.host-options.home-manager.dev.enable;
      };
  };

  config = lib.mkIf config.host-options.dev.formatters-and-linters.enable {
    home.packages = with pkgs; [
      prettier
      gdtoolkit_4
      markdownlint-cli2
    ];
  };
}
