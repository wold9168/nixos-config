{
  inputs,
  pkgs,
  lib,
  config,
  mylib,
  ...
}:
let
  softSource =
    path:
    lib.optionals (lib.pathExists "${config.home.homeDirectory}/${path}") [
      "source ${config.home.homeDirectory}/${path}"
    ];
  enablePowerlevel10k = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  zshInit = lib.concatStringsSep "\n" (
    [
      enablePowerlevel10k
    ]
    ++ softSource ".p10k.zsh"
  );
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
  home.file."${config.xdg.configHome}/.p10k.zsh" = {
    source = "${inputs.kitty-config}/.p10k.zsh";
    force = true;
  };
}
