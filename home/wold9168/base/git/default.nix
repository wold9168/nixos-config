{ myvar, ... }: {
  programs.git = {
    enable = true;
    settings.user.name = myvar.username;
    settings.user.email = myvar.userfullname;
  };
}
