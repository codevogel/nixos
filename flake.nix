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

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    elephant.url = "github:abenz1267/elephant";

    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };

    gazelle.url = "github:Zeus-Deus/gazelle-tui";
  };

  outputs =
    {
      self,
      nixpkgs,
      stylix,
      mnw,
      ...
    }@inputs:
    {
      packages.x86_64-linux =
        let
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          mnwPackages = import ./modules/shared/mnw/mnw.nix {
            inherit pkgs mnw self;
          };
        in
        mnwPackages;

      nixosConfigurations.home-nest = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs self; };
        modules = [
          ./hosts/home-nest/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      nixosConfigurations.work-nest = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs self; };
        modules = [
          ./hosts/work-nest/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

    };
}
