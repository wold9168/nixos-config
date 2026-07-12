{
  # pkgs,
  myvar,
  lib,
  ...
}:
{
  programs.zsh={
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  users.users."${myvar.username}" = {
    shell = lib.mkForce "/bin/zsh";
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
  };

}
