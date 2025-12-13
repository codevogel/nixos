{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mnw.url = "github:Gerg-L/mnw";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      mnw,
      ...
    }@inputs:
    {
      packages.x86_64-linux =
        let
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in
        {
          mnw = mnw.lib.wrap pkgs {
            neovim = pkgs.neovim-unwrapped;

            luaFiles = [ ./modules/nvim/init.lua ];

            plugins = {
              start = [
                pkgs.vimPlugins.lazy-nvim
              ];

              opt = [
                pkgs.vimPlugins.plenary-nvim
                pkgs.vimPlugins.oil-nvim
                pkgs.vimPlugins.snacks-nvim
                pkgs.vimPlugins.lualine-nvim
                pkgs.vimPlugins.nvim-web-devicons
              ];

              optAttrs = {
                harpoon = pkgs.vimPlugins.harpoon2;
              };

              dev.codevogel = {
                pure = ./modules/nvim;
                impure = "/home/codevogel/nixos/modules/nvim";
              };
            };
          };

          dev = self.packages.x86_64-linux.mnw.devMode;
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
