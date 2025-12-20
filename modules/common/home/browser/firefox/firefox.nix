{ inputs, pkgs, ... }:

let
  firefoxAddons = inputs.nur.legacyPackages.${pkgs.system}.repos.rycee.firefox-addons;
in
{
  programs.firefox = {
    enable = true;

    profiles.default = {
      settings = {
        extensions = {
          autoDisableScopes = 0;
          update = {
            autoUpdateDefault = false;
            enabled = false;
          };
        };
      };

      extensions = {
        packages = [
          firefoxAddons.bitwarden
          firefoxAddons.ublock-origin
          firefoxAddons.darkreader
        ];
      };
    };
  };
}
