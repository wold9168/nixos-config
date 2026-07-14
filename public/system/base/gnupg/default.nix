{ pkgs, ... }:
{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # TODO: Pinentry should be managed by rc of current shell.
    pinentryPackage = pkgs.pinentry-qt;
  };
  environment.systemPackages = with pkgs; [
    pinentry-curses
    pinentry-qt
  ];
}
