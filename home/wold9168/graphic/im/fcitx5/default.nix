{
  config,
  pkgs,
  inputs,
  ...
}:
let
  rime-data = pkgs.runCommand "rime-data" { } ''
    mkdir -p $out/share/rime-data
    cp -r ${inputs.rime-config}/* $out/share/rime-data/
  '';
in
{
  # catppuccin.fcitx5.enable = false;
  # xdg.configFile = {
  #   "fcitx5/profile" = {
  #     source = ./profile;
  #     # every time fcitx5 switch input method, it will modify ~/.config/fcitx5/profile,
  #     # so we need to force replace it in every rebuild to avoid file conflict.
  #     force = true;
  #   };
  #   # "mozc/config1.db".source =
  #   #   config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/linux/gui/base/fcitx5/mozc-config1.db";
  # };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      qt6Packages.fcitx5-configtool # GUI for fcitx5
      fcitx5-gtk # gtk im module

      # Chinese
      (fcitx5-rime.override { rimeDataPkgs = [ rime-data ]; }) # for flypy chinese input method
      # fcitx5-chinese-addons # we use rime instead

      # Japanese
      # ctrl-i / F7 - convert to takakana
      # ctrl-u / F6 - convert to hiragana
      # fcitx5-mozc-ut # Moze with UT dictionary
      fcitx5-anthy

      # Korean
      # fcitx5-hangul
    ];
    fcitx5.settings.inputMethod = {
      GroupOrder = {
        "0" = "Default";
        "1" = "i18n";
      };
      "Groups/0" = {
        Name = "Default";
        "Default Layout" = "us";
        DefaultIM = "rime";
      };
      "Groups/0/Items/0".Name = "keyboard-us";
      "Groups/0/Items/0".Layout = "";
      "Groups/0/Items/1".Name = "rime";
      "Groups/0/Items/1".Layout = "";
      "Groups/1" = {
        Name = "i18n";
        "Default Layout" = "us";
        DefaultIM = "anthy";
      };
      "Groups/1/Items/0".Name = "keyboard-us";
      "Groups/1/Items/0".Layout = "";
      "Groups/1/Items/1".Name = "anthy";
      "Groups/1/Items/1".Layout = "";
      "Groups/1/Items/2".Name = "keyboard-ru";
      "Groups/1/Items/2".Layout = "";
      "Groups/1/Items/3".Name = "keyboard-fr";
      "Groups/1/Items/3".Layout = "";
    };
  };
}
