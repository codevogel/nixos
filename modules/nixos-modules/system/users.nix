{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.system.users.enable {
    programs.zsh.enable = true;
    users.users = {
      root = {
        shell = pkgs.zsh;
      };
      codevogel = {
        isNormalUser = true;
        description = "codevogel";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
      };
    };

  };
}
