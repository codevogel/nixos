{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.shell.oh-my-posh.enable {
    programs.oh-my-posh = {
      enable = true;
      useTheme = "patriksvensson";
    };
  };
}
