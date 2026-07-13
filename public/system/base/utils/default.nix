{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ripgrep
    jq
    fd
    gawk
    gnupg
    jekyll
    glow
  ];
}
