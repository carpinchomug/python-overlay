pkgs: path: overrides:

let
  packagesWithPython = pkgs // pkgs.python3Packages;
  f = import path;
in
f ((builtins.intersectAttrs (builtins.functionArgs f) packagesWithPython) // overrides)
