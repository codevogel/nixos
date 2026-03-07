{
  self,
  inputs,
  lib,
  config,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.default ];

  config = lib.mkIf config.my.features.system.homeManager.enable {

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit self inputs; };
      users = {
        "codevogel" = {
          imports = [
            ../../hm-modules/default.nix
          ];
          programs.home-manager.enable = true;

          # Home Manager needs a bit of information about you and the paths it should
          # manage.
          home.username = "codevogel";

          home.stateVersion = config.system.stateVersion;

          home.sessionVariables = {
            EDITOR = "nvim";
          };
        };
      };
    };
  };
}
