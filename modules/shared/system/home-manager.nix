{ self, inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit self inputs; };
    users = {
      "codevogel" = {
        imports = [
          ../home/home.nix
          inputs.walker.homeManagerModules.default
        ];
      };
    };
  };
}
