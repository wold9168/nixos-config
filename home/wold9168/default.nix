{ pkgs, myvar, ... }:
{
  imports = [ ./base ];
  home.username = myvar.username;
  home.homeDirectory = "/home/wold9168";
  programs.git = {
    enable = true;
    settings.user.name = "wold9168";
    settings.user.email = "moewold@outlook.com";
  };

  # User-level Applications
  home.packages = with pkgs; [

  ];

  home.stateVersion = "26.05";
}
