{
  ...
}:

{
  imports = [
    ./terminal/emulator/kitty/kitty.nix
    ./terminal/tmux/tmux.nix
    ./shell/git/git.nix
    ./shell/git/lazygit.nix
    ./shell/zsh/zsh.nix
    ./shell/oh-my-posh/oh-my-posh.nix
    ./browser/firefox/firefox.nix
    ./editor/nvim/nvim.nix
    ./wm/hypr/hyprland.nix
    ./audio/wiremix/wiremix.nix
    ./audio/pamixer/pamixer.nix
    ./launcher/walker/walker.nix
    ./music/spotify/spotify.nix
    ./music/playerctl/playerctl.nix
    ./file-explorer/yazi/yazi.nix
    ./file-explorer/nautilus/nautilus.nix
    ./networking/gazelle/gazelle.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "codevogel";
  home.homeDirectory = "/home/codevogel";

  home.stateVersion = "25.11"; # Read up on this before changing!

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
