{ inputs, pkgs, ... }:

let
  firefoxAddons =
    inputs.nur.legacyPackages.${pkgs.stdenv.hostPlatform.system}.repos.rycee.firefox-addons;
in
{
  programs.firefox = {
    enable = true;

    profiles."codevogel" = {
      settings = {
        extensions = {
          autoDisableScopes = 0;
          update = {
            autoUpdateDefault = false;
            enabled = false;
          };
        };

        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;

        "browser.newtabpage.discoverystream.personalization.enabled" = false;
        "browser.urlbar.quicksuggest.dataCollection.enabled" = false;

        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.usage.uploadEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;

        "privacy.globalprivacycontrol.enabled" = true;

        "signon.rememberSignons" = false;
      };

      extensions = {
        force = true;
        packages = [
          firefoxAddons.bitwarden
          firefoxAddons.ublock-origin
          firefoxAddons.darkreader
          firefoxAddons.sponsorblock
        ];
      };
    };
  };
}
