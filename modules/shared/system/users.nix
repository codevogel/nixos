{ pkgs, ... }:

{
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
}
