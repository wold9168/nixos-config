{ pkgs, myvar, ... }:
{
  home.username = myvar.username;
  home.homeDirectory = "/home/wold9168";
  programs.git = {
    enable = true;
    settings.user.name = "wold9168";
    settings.user.email = "moewold@outlook.com";
  };

  # User-level Applications
  home.packages = with pkgs; [
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

  home.stateVersion = "26.05";
}
