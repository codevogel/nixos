{
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.my.features.system.nix-ld.enable {
    programs.nix-ld.enable = true;
  };
}
