{ inputs, ... }:
{
  programs.zed-editor = {
    enable = true;
  };
  xdg.configFile."zed" = {
    source = "${inputs.zed-config}/";
    force = true;
  };
}
