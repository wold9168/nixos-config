{ ... }@inargs: {
  users."wold9168" = {
    isNormalUser = true;
    description = "wold9168";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPpRSgZTTzpWvrLMPceSkrkDe2LtHumAWd/33p+ExU9G moewold@outlook.com"
    ];
  };
}
