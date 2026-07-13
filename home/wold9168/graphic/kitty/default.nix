{ inputs, pkgs, ... }: {
  programs.kitty = {
    enable = true;

    font = {
      name = "BlexMono Nerd Font";
      size = 20.0;
    };

    themeFile = "Catppuccin-Latte";

    settings = {
      scrollback_lines = 102400;
    };

    keybindings = {
      "kitty_mod+/" =
        "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";
    };

    quickAccessTerminalConfig = {
      lines = 30;
      columns = 110;
    };

    shellIntegration.enableZshIntegration = true;
  };

  home.file.".config/kitty/search.py".source = "${inputs.kitty-config}/search.py";
  home.file.".config/kitty/scroll_mark.py".source = "${inputs.kitty-config}/scroll_mark.py";
}
