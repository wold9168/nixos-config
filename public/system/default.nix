{ pkgs, inputs, ... }: {
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
  environment.systemPackages = with pkgs; [
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
  ];

  users.users."wold9168" = {
    isNormalUser = true;
    description = "wold9168";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPpRSgZTTzpWvrLMPceSkrkDe2LtHumAWd/33p+ExU9G moewold@outlook.com"
    ];
  };
}
