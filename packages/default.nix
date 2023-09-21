{
  perSystem = { pkgs, ... }:
    let
      callPythonPackage = import ../helper.nix pkgs;
    in
    {
      packages = {
        torch-geometric = callPythonPackage ./torch-geometric.nix { };
      };
    };
}
