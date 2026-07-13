{ lib }:
{
  username = "wold9168";
  userfullname = "Shinonome Tera tanuki";
  useremail = "moewold@outlook.com";
  mainSshAuthorizedKeys = [];
  secondaryAuthorizedKeys = [];
  networking = import ./networking.nix { inherit lib; };
  mainGpgAuthorizedKey = "FC943B58B2F66D8C";
} 
