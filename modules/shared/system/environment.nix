{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      wget
      curl
      git
      git-lfs
      vim
      neovim
      fzf
      home-manager
      htop
      openssl
      ethtool
    ];

    variables = {

    };
  };
}
