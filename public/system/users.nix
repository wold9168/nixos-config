{ lib, pkgs, myvar, ... }: {
  users.users."${myvar.username}" = {
    isNormalUser = true;
    description = myvar.userfullname;
    shell = lib.mkDefault pkgs.bash;
    createHome = true;
    extraGroups = [
      "networkmanager"
      "video"
      "render"
      "wheel"
    ];
    openssh.authorizedKeys.keys = myvar.mainSshAuthorizedKeys;
  };
}
