{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      wget
      curl
      git
      vim
      neovim
      fzf
      home-manager
      spotify
      htop
    ];

    variables = {

    };
  };
}
