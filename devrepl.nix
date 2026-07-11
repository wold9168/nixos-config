{ developHostSystem, nixpkgs }:
let
  pkgs = import nixpkgs { system = developHostSystem; };
in
pkgs.writeShellScriptBin "dev-repl" ''
  exec ${pkgs.nix}/bin/nix repl flake:nixpkgs
''
