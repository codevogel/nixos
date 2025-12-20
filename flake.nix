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
          mnwPackages = import ./modules/common/mnw/mnw.nix {
            inherit pkgs mnw self;
          };
        in
        mnwPackages;

      nixosConfigurations.home-nest = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs self; };
        modules = [
          ./hosts/home-nest/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
