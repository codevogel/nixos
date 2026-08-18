{

  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.claude-code.enable {
    programs.claude-code = {
      enable = true;
      package = pkgs.claude-code;
      skills = ./skills;
    };
  };
}
