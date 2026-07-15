{
  description = "NixOS Configuration by wold9168, for Trusted Open Utility & Gear Hub (tough)";

  # TODO: Add CUDA Support for toughc
  nixConfig = {
    # substituers will be appended to the default substituters when fetching packages
    extra-substituters = [
      "https://cache.nixos-cuda.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
    ];
  };

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

    dotfile = {
      url = "github:wold9168/dotfile/master";
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
      specialArgsInstance = { inherit inputs self mylib myvar; };

      developHostSystem = "x86_64-linux";

      overlayModule = { nixpkgs.overlays = overlayList; };
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
            overlayModule
            ./hosts/toughc
            (home-manager-module { isGraphicHost = true; })
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };
        toughqemu = lib.nixosSystem {
          specialArgs = specialArgsInstance;
          modules = [
            overlayModule
            ./hosts/toughqemu
            (home-manager-module { isGraphicHost = true; })
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };
        toughrpi = lib.nixosSystem {
          specialArgs = specialArgsInstance;
          modules = [
            overlayModule
            ./hosts/toughrpi
            (home-manager-module { isGraphicHost = false; })
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };
      };
      devShellsInstance = import ./devshell.nix { inherit developHostSystem nixpkgs; };
      devReplEnv = import ./devrepl.nix { inherit developHostSystem nixpkgs; };
      overlayList = import ./overlays { inherit inputs self; };
      packagesInstance = let
        pkgsFor = system: import nixpkgs { inherit system; };
        base = lib.genAttrs [ "x86_64-linux" "aarch64-linux" ] (system: {
          rime-data = (pkgsFor system).callPackage
            ./pkgs/rime-data/package.nix { inherit inputs; };
        });
      in base // {
        "${developHostSystem}" = base."${developHostSystem}" // { devRepl = devReplEnv; };
      };
    in
    {
      inherit inputs;
      nixosConfigurations = nixosConfigurationsInstance;
      devShells = devShellsInstance;
      packages = packagesInstance;
      overlays.default = lib.composeManyExtensions overlayList;
    };
}
