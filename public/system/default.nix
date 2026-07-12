{ pkgs, inputs, ... }@inargs:
{
  time.timeZone = "Asia/Shanghai";

  nixpkgs.config.allowUnfree = true;

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  imports = [ ./networking.nix ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  environment.systemPackages = import ./system-level-pkgs.nix { inherit inargs; };

  users = import ./users.nix { inherit inargs; };
}
