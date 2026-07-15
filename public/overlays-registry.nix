{ inputs, self, ... }: {
  nixpkgs.overlays = import ../overlays { inherit inputs self; };
}
