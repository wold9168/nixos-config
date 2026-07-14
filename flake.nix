{
  description = "NixOS Configuration by wold9168, for Trusted Open Utility & Gear Hub (tough)";

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

    # My configuration
    kitty-config = {
      url = "github:wold9168/kitty-config/master";
      flake = false;
    };

    opencode-config = {
      url = "github:wold9168/opencode-config/master";
      flake = false;
    };

    zed-config = {
      url = "github:wold9168/zed-config/master";
      flake = false;
    };

    rime-config = {
      url = "github:wold9168/rime-ice/main";
      flake = false;
    };
  };
  inputs.self.submodules = true;
  inputs.self.lfs = true;
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    # inputs includes object in flake's inputs.
    let
      inherit (inputs.nixpkgs) lib;
      mylib = import ./lib { inherit lib; };
      myvar = import ./var { inherit lib; };
      specialArgsInstance = { inherit inputs mylib myvar; };

      developHostSystem = "x86_64-linux";

      home-manager-module =
        { isGraphicHost }:
        {
          imports = [ home-manager.nixosModules.home-manager ];
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgsInstance // {
              inherit isGraphicHost;
            };
            users.wold9168 = {
              imports = [
                ./home/wold9168
                inputs.catppuccin.homeModules.catppuccin
              ];
            };
            backupFileExtension = "backup";
          };
        };

      # Per-host NixOS configurations
      nixosConfigurationsInstance = rec {
        default = toughc;
        toughc = lib.nixosSystem {
          specialArgs = specialArgsInstance;
          modules = [
            ./hosts/toughc
            (home-manager-module { isGraphicHost = true; })
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };
        toughqemu = lib.nixosSystem {
          specialArgs = specialArgsInstance;
          modules = [
            ./hosts/toughqemu
            (home-manager-module { isGraphicHost = true; })
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };
        toughrpi = lib.nixosSystem {
          specialArgs = specialArgsInstance;
          modules = [
            ./hosts/toughrpi
            (home-manager-module { isGraphicHost = false; }) # need test
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };
      };
      devShellsInstance = import ./devshell.nix { inherit developHostSystem nixpkgs; };
      devReplEnv = import ./devrepl.nix { inherit developHostSystem nixpkgs; };
    in
    {
      inherit inputs;
      nixosConfigurations = nixosConfigurationsInstance;
      devShells = devShellsInstance;
      packages."${developHostSystem}"."devRepl" = devReplEnv;
    };
}
