{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config =
    lib.mkIf osConfig.host-options.home-manager.desktop-environment.recording.obs-studio.enable
      {
        environment.systemPackages = with pkgs; [
          obs-studio
        ];
      };
}
