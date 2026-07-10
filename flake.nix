{
  description = "Flake of Trusted Open Utility & Gear Hub Node C";

  inputs = {
    # Official NixOS source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-2605.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix/v26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # 3rd-party software source
    helix.url = "github:helix-editor/helix/master";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (inputs.nixpkgs) lib;

      home-manager-module = {
        imports = [ home-manager.nixosModules.home-manager ];
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.wold9168 = import ./home;
      };

      # Per-host NixOS configurations
      nixosSystems = rec {
        default = toughc;
        toughc = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/toughc
            home-manager-module
          ];
        };
        toughqemu = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/toughqemu
            home-manager-module
          ];
        };
        toughrpi = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/toughrpi
            home-manager-module
          ];
        };
      };
    in
    {
      nixosConfigurations = nixosSystems;
    };
}
