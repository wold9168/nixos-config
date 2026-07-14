{
  ...
}:
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
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
  };

  # TODO: Set the prompt as $

  # TODO: Try to set up oh-my-zsh and powerlevel10k
  # https://search.nixos.org/packages?channel=26.05&query=powerlevel&size=30#show=zsh-powerlevel10k
}
