{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    sysstat
    lm_sensors
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];
}
