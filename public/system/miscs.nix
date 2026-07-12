{ ... }: {
  time.timeZone = "Asia/Shanghai";

  nixpkgs.config.allowUnfree = true;
}
