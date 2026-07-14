{ inputs, ... }:
{
  programs.opencode.enable = true;
  xdg.configFile."opencode" = {
    source = "${inputs.opencode-config}/";
    force = true;
    recursive = true;
  };
}
