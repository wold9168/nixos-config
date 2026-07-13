{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    htop
    iotop
    iftop
  ];
}
