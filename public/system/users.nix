{ myvar, ... }: {
  users.users."${myvar.username}" = {
    isNormalUser = true;
    description = myvar.userfullname;
    shell = "/bin/zsh"; # TODO: Set bash as fallback;
    createHome = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = myvar.mainSshAuthorizedKeys;
  };
}
