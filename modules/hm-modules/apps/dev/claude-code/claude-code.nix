{

  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.claude-code.enable {
    programs.claude-code = {
      enable = true;
      skills = ./skills;
    };
  };
}
