{ ... }:

{
  home-manager = {
    users = {
      "codevogel" = {
        imports = [
          ../home-manager/default.nix
        ];
      };
    };
  };
}
