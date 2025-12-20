{ pkgs, ... }:

{
  # The 'shell' opt requires programs.<shell>.enable = true in ./programs.nix
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
      packages = with pkgs; [ ];
      shell = pkgs.zsh;
    };
  };
}
