{ myvar, ... }: {
  programs.git = {
    enable = true;
    settings.user.name = myvar.username;
    settings.user.email = myvar.userfullname;
    lfs = {
      enable = true;
    };
    # TODO: After setting up GnuPG, enable signoffByDefault of Git
  };
}
