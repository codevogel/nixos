{
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.my.features.apps.dev.docker.enable {
    virtualisation.docker.enable = true;
    users.users.codevogel.extraGroups = [ "docker" ];
  };
}
