default:
    @just --list

deploy:
    nixos-rebuild switch --flake . --use-remote-sudo

debug:
    nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

up:
    nix flake update

# Update specific input
# usage: make upp i=home-manager
upp:
    nix flake update $(i)

check:
    nix flake check

history:
    nix profile history --profile /nix/var/nix/profiles/system

repl:
    @echo -e '\e[34mRun ":lf ." to load flake of this repo.\e[0m'
    nix run .\#devRepl

clean:
    # remove all generations older than 7 days
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
    # garbage collect all unused nix store entries
    sudo nix store gc --debug
    sudo nix-collect-garbage --delete-old
