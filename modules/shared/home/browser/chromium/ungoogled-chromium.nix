{ pkgs, ... }:

let
  chromium = pkgs.ungoogled-chromium;

  iconDir = ./webapps/icons;

  mkWebApp = import ./mkWebApp.nix {
    inherit chromium iconDir;
  };

  webappFiles = builtins.attrNames (builtins.readDir ./webapps);

  filtered = builtins.filter (f: f != "icons" && pkgs.lib.hasSuffix ".nix" f) webappFiles;

  webapps = map (f: import (./webapps + "/${f}") { inherit mkWebApp; }) filtered;
in
{
  home.packages = [ chromium ];

  xdg.desktopEntries = builtins.foldl' (a: b: a // b) { } webapps;
}
