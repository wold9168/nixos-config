{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    which
    file
  ];
}
