{ pkgs, inputs, ... }@inargs:
{
  time.timeZone = "Asia/Shanghai";

  nixpkgs.config.allowUnfree = true;

  imports = [ ./networking.nix ./i18n.nix ./nix-feature.nix ];
  
  environment.systemPackages = import ./system-level-pkgs.nix { inherit inargs; };

  users = import ./users.nix { inherit inargs; };
}
