{
  description = "Build a NixOS SD image for Raspberry Pi 4";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };
  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      buildSDImage =
        system:
        let
          # 在 x86_64 上使用交叉编译工具链，在 aarch64 上直接使用本地工具链
          pkgs =
            if system == "x86_64-linux" then
              nixpkgs.legacyPackages.${system}.pkgsCross.aarch64-multiplatform
            else
              nixpkgs.legacyPackages.${system};

          lib = nixpkgs.lib;

          config = { ... }: {
            imports = [
              "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
            ];

            system.stateVersion = "26.05";

            networking.hostName = "toughrpi";

            # Enable SSH
            users.users.root.openssh.authorizedKeys.keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPpRSgZTTzpWvrLMPceSkrkDe2LtHumAWd/33p+ExU9G moewold@outlook.com"
            ];
            services.openssh = {
              enable = true;
              settings.PasswordAuthentication = false;
            };

            environment.systemPackages = with pkgs; [
              vim
              git
              zsh
            ];
          };

          nixos = lib.nixosSystem {
            system = "aarch64-linux";
            pkgs = pkgs;
            modules = [ config ];
          };
        in
        nixos.config.system.build.sdImage; # 返回最终的镜像 derivation

    in
    {
      packages = forAllSystems (system: {
        default = buildSDImage system;
        sdImage = buildSDImage system;
      });
    };
}
