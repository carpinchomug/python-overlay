{
  perSystem = { pkgs, ... }:
    let
      callPythonPackage = import ../helper.nix pkgs;
    in
    {
      packages = {
        category-encoders = callPythonPackage ./category-encoders.nix { };
        torch-geometric = callPythonPackage ./torch-geometric.nix { };
      };
    };
}
