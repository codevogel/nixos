{
  self,
  inputs,
  lib,
  config,
  ...
}:

{
  options = {
    host-options.system.home-manager.enable = lib.mkEnableOption "Enable system.home-manager" // {
      default = config.host-options.system.enable;
    };
    host-options.system.home-manager.stateVersion = lib.mkOption {
      type = lib.types.str;
      default = "25.11";
      description = "The Home Manager state version to use. This should be set to the date of the latest Home Manager release that you want to use.";
    };
  };

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
