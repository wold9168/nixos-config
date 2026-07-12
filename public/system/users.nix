{ lib, myvar, ... }: {
  users.users."${myvar.username}" = {
    isNormalUser = true;
    description = myvar.userfullname;
    shell = lib.mkDefault "/bin/bash";
    createHome = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = myvar.mainSshAuthorizedKeys;
  };
}
