{
  # pkgs,
  myvar,
  lib,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };
  users.users."${myvar.username}" = {
    shell = lib.mkForce pkgs.zsh;
  };
  environment.pathsToLink = [ "/share/zsh" ]; # Enable Completion of ZSH,
}
