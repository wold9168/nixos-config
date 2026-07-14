{
  pkgs,
  lib,
  ...
}:
let
  enablePowerlevel10k = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  zshInit = lib.mkMerge [
    enablePowerlevel10k
  ];
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    defaultKeymap = "emacs";
    history = {
      size = 102400;
      save = 102400;
      append = true;
      extended = true;
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "robbyrussell";
    };
    initContent = zshInit;
  };
  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];
}
