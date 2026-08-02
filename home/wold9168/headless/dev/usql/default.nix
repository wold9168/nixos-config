{
  pkgs,
  inputs,
  config,
  ...
}:
{
  home.packages = with pkgs; [ usql ];
  home.file."${config.home.homeDirectory}/.usqlrc" = {
    source = "${inputs.dotfile}/.usqlrc";
    force = true;
  };
}
