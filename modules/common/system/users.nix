{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    host-options.users.enable = lib.mkEnableOption "Enable users" // {
      default = true;
    };
  };

  config = lib.mkIf config.host-options.users.enable {
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
