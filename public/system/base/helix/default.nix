{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    inputs.helix.packages."${pkgs.stdenv.hostPlatform.system}".helix
  ];
}
