{
  pkgs,
  inputs,
  config,
  ...
}:
{
  home.packages = with pkgs; [ usql ];
  home.file."${config.xdg.configHome}/.usqlrc" = {
    source = "${inputs.kitty-config}/.usqlrc";
    force = true;
  };
}
