{
  pkgs,
  myvar,
  mylib,
  ...
}:
{
  imports = [ ./base ] ++ mylib.scanPaths ./.;
  
  home.username = myvar.username;
  home.homeDirectory = "/home/wold9168";

  # User-level Applications
  home.packages = with pkgs; [ ];

  home.stateVersion = "26.05";
}
