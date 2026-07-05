{ config, pkgs, ... }:
{
  home.username = "wold9168";
  home.homeDirectory = "/home/wold9168";
  programs.git = {
    enable = true;
    userName = "wold9168";
    userEmail = "moewold@outlook.com";
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
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  home.stateVersion = "26.05";
}
