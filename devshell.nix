{ developHostSystem, nixpkgs }:
{
  "${developHostSystem}" = rec {
    default = toughc;
    toughc =
      let
        pkgs = import nixpkgs { system = developHostSystem; };
        packages = with pkgs; [
          nix
          # fix https://discourse.nixos.org/t/non-interactive-bash-errors-from-flake-nix-mkshell/33310
          bashInteractive
          # fix `cc` replaced by clang, which causes nvim-treesitter compilation error
          gcc
          # Nix-related
          nixfmt
          deadnix
          statix
          # spell checker
          typos
          # code formatter
          prettier
        ];
      in
      pkgs.mkShell {
        inherit packages;
        shellHook = ''
          echo devShell launched.
        '';
      };
  };
}
