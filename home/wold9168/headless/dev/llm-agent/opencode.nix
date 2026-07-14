{ inputs, ... }:
{
  programs.opencode.enable = true;
  home.file.".config/nvim" = {
    source = "${inputs.opencode-config}/";
    force = true;
    recursive = true;
  };
}
