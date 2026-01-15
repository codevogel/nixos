{ pkgs, ... }:

let
  pls = pkgs.stdenv.mkDerivation {
    pname = "pls";
    version = "0.1.0";

    src = pkgs.fetchurl {
      url = "https://github.com/codevogel/pls/releases/download/v0.1.0/pls";
      sha256 = "1zpl5x8xlb8zp7zmhkpna5naz1znwb3iwfibmdqkiiznnkndzqf0";
    };

    unpackPhase = ''true'';

    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/pls
      chmod +x $out/bin/pls
    '';
  };
in
{
  home.packages = with pkgs; [
    pls

    # Dependencies:
    yq-go
    fzf
  ];

  home.file.".pls.yml" = {
    source = ./.pls.yml;
    force = true;
  };
}
