{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.dotnet.enable {
    home.packages = with pkgs; [
      dotnet-sdk_10
    ];
  };
}
