{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.shell.ohMyPosh.enable {
    programs.oh-my-posh = {
      enable = true;
      useTheme = "patriksvensson";
    };
  };
}
