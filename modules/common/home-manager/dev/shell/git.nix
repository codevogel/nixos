{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.shell.git.enable {
    programs.git = {
      enable = true;
      settings.user = {
        name = "Kamiel de Visser";
        email = "kamieldevisser@gmail.com";
      };
    };
  };
}
