{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.my.features.system.jmtpfs.enable {
    environment.systemPackages = with pkgs; [
      jmtpfs
    ];
  };
}
