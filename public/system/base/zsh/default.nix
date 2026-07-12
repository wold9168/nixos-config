{
  # pkgs,
  myvar,
  lib,
  ...
}:
{
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.syntaxHighlighting.enable = true;
  users.users."${myvar.username}" = {
    shell = lib.mkForce "/bin/zsh";
  };
}
