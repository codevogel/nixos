{
  description = "Nixos config flake";

  inputs = {
    # nixpkgs, the package collection used for nixos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # nixos-wsl, a collection of nixos modules for wsl
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager, a nixos module for managing user environments
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # minimal neovim wrapper, used to manage neovim plugins and configuration
    mnw.url = "github:Gerg-L/mnw";
    # neovim-nightly-overlay, provides neovim nightly builds
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix user repository, contains a lot of nix packages and modules that are not in nixpkgs
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # stylix, a theming framework for nixos and home-manager
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # elephant, a data provider service and backend for building custom application launchers and desktop utilities
    elephant = {
      url = "github:abenz1267/elephant";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # walker, a multi-purpose launcher built on top of elephant
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # gazelle, a TUI for NetworkManager
    gazelle = {
      url = "github:Zeus-Deus/gazelle-tui";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sops-nix, a nixos module for managing secrets
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      stylix,
      mnw,
      sops-nix,
      ...
    }@inputs:
    {

      packages.x86_64-linux =

        let
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          mnwPackages = import ./modules/common/mnw/default.nix {
            inherit
              pkgs
              mnw
              self
              inputs
              ;
          };
        in
        mnwPackages;

      nixosConfigurations = {
        home-nest = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs self; };
          modules = [
            ./hosts/home-nest/configuration.nix
            stylix.nixosModules.stylix
            sops-nix.nixosModules.sops
          ];
        };

        work-nest = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs self; };
          modules = [
            ./hosts/work-nest/configuration.nix
            stylix.nixosModules.stylix
            sops-nix.nixosModules.sops
          ];
        };

        work-nest-wsl = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs self; };
          modules = [
            ./hosts/work-nest/wsl/configuration.nix
          ];
        };
      };
    };
}
