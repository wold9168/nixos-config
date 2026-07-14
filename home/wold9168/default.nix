{
  pkgs,
  lib,
  myvar,
  mylib,
  isGraphicHost ? true,
  ...
}:
{
  imports = [ ./headless ]
    ++ lib.optionals isGraphicHost (mylib.scanPaths ./graphic);
  
  home.username = myvar.username;
  home.homeDirectory = "/home/wold9168";

  # User-level Applications
  home.packages = with pkgs; [ ];

  home.stateVersion = "26.05";
}
