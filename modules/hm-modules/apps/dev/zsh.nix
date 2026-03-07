{
  lib,
  osConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf osConfig.host-options.home-manager.dev.shell.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.size = 10000;
      oh-my-zsh = {
        enable = true;
      };
    };
  };
}
