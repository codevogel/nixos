{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.dev.dotnet.enable = lib.mkEnableOption "Enable dev.dotnet" // {
      default = config.host-options.home-manager.dev.enable;
    };
  };

  config = lib.mkIf config.host-options.dev.dotnet.enable {
    home.packages = with pkgs; [
      dotnet-sdk_10
    ];
  };
}
