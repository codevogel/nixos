{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.host-options.system.neovim.enable {
    environment.systemPackages = with pkgs; [
      neovim
    ];
  };
}
