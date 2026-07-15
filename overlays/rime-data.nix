{ self, ... }: _: prev: let
  inherit (prev.stdenv.hostPlatform) system;
in {
  rime-data = self.packages.${system}.rime-data;
}
