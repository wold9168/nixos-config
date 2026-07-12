{ inputs, pkgs, ... }:
with pkgs;
[
  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  neovim
  git
  inputs.helix.packages."${pkgs.stdenv.hostPlatform.system}".helix

  # shell
  zsh

  # administration tool
  ## disk
  kdePackages.partitionmanager
  ## network
  mtr
  iperf3
  dnsutils
  ldns
  curl
  wget
  aria2
  socat
  nmap
  ipcalc
  ## system tools
  sysstat
  lm_sensors
  ethtool
  pciutils # lspci
  usbutils # lsusb
]
