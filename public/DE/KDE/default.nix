{ ... }: {
  # X11 + KDE Plasma Desktop Environment
  services.xserver.enable = false;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.kdeconnect.enable = true;
  programs.partition-manager.package = true;
}
