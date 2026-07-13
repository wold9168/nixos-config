{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ripgrep
    jq
    fd
    gawk
    jekyll
    glow
  ];
}
