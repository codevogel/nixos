{
  lib,
  osConfig,
  ...
}:

{
  config = lib.mkIf osConfig.my.features.apps.dev.lazygit.enable {
    programs.lazygit = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        git.diffRenderers = [ { command = "delta --dark --paging=never"; } ];
      };
    };
  };
}
