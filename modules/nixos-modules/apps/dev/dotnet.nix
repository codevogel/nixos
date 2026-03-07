{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.dotnet.enable {
    environment.systemPackages = with pkgs; [
      dotnet-sdk_10
    ];
  };
}
