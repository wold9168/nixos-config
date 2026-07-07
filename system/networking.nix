{ pkgs, inputs, ... }: {
  networking.networkmanager.enable = true;
  networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  networking.proxy.default = "socks5://192.168.10.2:1100/"; # Use the toughnet-router as proxy entry.
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}
