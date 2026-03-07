{
  self,
  inputs,
  lib,
  config,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.default ];

  config = lib.mkIf config.host-options.system.home-manager.enable {

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit self inputs; };
      users = {
        "codevogel" = {
          imports = [
            ../home-manager/default.nix
          ];
          programs.home-manager.enable = true;

          # Home Manager needs a bit of information about you and the paths it should
          # manage.
          home.username = "codevogel";

          home.stateVersion = config.host-options.system.home-manager.stateVersion;

          home.sessionVariables = {
            EDITOR = "nvim";
          };
        };
      };
    };
  };
}
