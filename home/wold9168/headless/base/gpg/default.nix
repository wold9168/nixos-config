{ pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    
    pinentry.package = pkgs.pinentry-qt;
    
  };
}
