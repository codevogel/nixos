{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.dotnet.enable {
    environment.systemPackages = with pkgs; [
      dotnet-sdk_10
    ];
  };
}
