{ pkgs, ... }:

let
  peck = pkgs.stdenv.mkDerivation {
    pname = "peck";
    version = "0.1.1";

    src = pkgs.fetchurl {
      url = "https://github.com/codevogel/peck/releases/download/v0.1.1/peck";
      sha256 = "b2eabeae7b8faecbff9d51acf8d3b66a157584013e6b47ab780f7bb9d90c3b66";
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
    wayfreeze
  ];
}
