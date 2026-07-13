{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    inputs.helix.packages."${pkgs.stdenv.hostPlatform.system}".helix

    # administration tool
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

    # compress
    zip
    xz
    unzip
    p7zip
    gnutar
    zstd

    # performance
    btop
    htop
    iotop
    iftop

    # utils
    ripgrep
    jq
    fd
    gawk
    gnupg
    jekyll
    glow

    # nix-related
    nix-output-monitor

    # misc
    which
    file
  ];
}
