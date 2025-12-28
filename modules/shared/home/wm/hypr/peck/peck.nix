{ pkgs, ... }:

let
  peck = pkgs.stdenv.mkDerivation {
    pname = "peck";
    version = "0.1.0";

    src = pkgs.fetchurl {
      url = "https://github.com/codevogel/peck/releases/download/v0.1.0/peck";
      sha256 = "47bfd14c390c6f09e521c864efbd2d7ed608164240d07c6ecf48c2b7677dbabc";
    };

    unpackPhase = ''true'';

    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/peck
      chmod +x $out/bin/peck
    '';
  };
in
{
  home.packages = with pkgs; [
    peck

    # Dependencies:
    grim
    slurp
    wf-recorder
    ffmpeg
    wl-clipboard
  ];
}
