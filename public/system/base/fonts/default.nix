{ lib, pkgs, ... }:
{
  fonts.enableDefaultPackages = true;
  fonts.enableGhostscriptFonts = true;
  # Install Nerd Fonts
  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
