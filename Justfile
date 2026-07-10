default:
    @just --list

check:
    nix flake check

history:
    nix profile history --profile /nix/var/nix/profiles/system

repl:
  nix repl -f flake:nixpkgs