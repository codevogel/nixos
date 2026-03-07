{
  lib,
  config,
  self,
  ...
}:

{
  config = lib.mkIf config.my.features.system.neovim.enable {
    environment.systemPackages = [
       self.packages.x86_64-linux.mnw
    ];
  };
}
