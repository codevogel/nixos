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
        home.packages = with pkgs; [
          obs-studio
        ];
      };
}
