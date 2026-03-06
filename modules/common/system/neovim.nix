{
  lib,
  config,
  self,
  ...
}:

{
  config = lib.mkIf config.host-options.system.neovim.enable {
    environment.systemPackages = [
       self.packages.x86_64-linux.mnw
    ];
  };
}
