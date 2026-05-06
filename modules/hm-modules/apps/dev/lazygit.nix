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
        git.pagers = [ { pager = "delta --dark --paging=never"; } ];
      };
    };
  };
}
