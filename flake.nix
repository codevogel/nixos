{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mnw = {
      url = "github:Gerg-L/mnw";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, mnw, ... }@inputs: {
    packages.x86_64-linux =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in
      {
        mnw = mnw.lib.wrap pkgs {
          neovim = pkgs.neovim-unwrapped;
          initLua = ''
            require('codevogel')
          '';
          plugins = {
            start = [ pkgs.vimPlugins.oil-nvim ];
            dev.codevogel = {
              pure = ./modules/nvim;
              impure = "/home/codevogel/nixos/modules/nvim";
            };
          };
        };

        dev = self.packages.x86_64-linux.default.devMode;
      };

    nixosConfigurations.home-nest = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs self; };
      modules = [
        ./hosts/home-nest/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
