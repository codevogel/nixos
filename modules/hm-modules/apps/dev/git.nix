{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.system.git.enable {
    programs.git = {
      enable = true;
      settings.user = {
        name = "Kamiel de Visser";
        email = "kamieldevisser@gmail.com";
      };
    };
  };
}
