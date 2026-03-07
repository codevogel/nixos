{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.dotnet.enable {
    environment.systemPackages = with pkgs; [
      dotnet-sdk_10
    ];
  };
}
