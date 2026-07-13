{ pkgs, ... }:
{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # Do not set Pinentry. Pinentry should be managed by rc of current shell.
  };
}
