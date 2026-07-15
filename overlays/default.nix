# import all files with `args` in this directory, excluding "default.nix".
args:
builtins.map (f: (import (./. + "/${f}") args)) (
  builtins.filter
    (
      f:
      f != "default.nix"
    )
    (builtins.attrNames (builtins.readDir ./.))
)