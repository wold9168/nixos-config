{ lib }:
{
  username = "wold9168";
  userfullname = "Shinonome Tera tanuki";
  useremail = "moewold@outlook.com";
  mainSshAuthorizedKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPpRSgZTTzpWvrLMPceSkrkDe2LtHumAWd/33p+ExU9G moewold@outlook.com"
  ];
  secondaryAuthorizedKeys = [ ];
  networking = import ./networking.nix { inherit lib; };
  mainGpgAuthorizedKey = "FC943B58B2F66D8C";
}
