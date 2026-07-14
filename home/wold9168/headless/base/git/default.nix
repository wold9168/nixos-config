{ myvar, ... }:
{
  programs.git = {
    enable = true;
    settings.user.name = myvar.username;
    settings.user.email = myvar.userfullname;
    lfs = {
      enable = true;
    };
    signing = {
      key = myvar.mainGpgAuthorizedKey;
      signByDefault = true;
    };
  };
}
