{
  perSystem = { pkgs, ... }:
    let
      inherit (pkgs.python3Packages) callPackage;
    in
    {
      packages = {
        category-encoders = callPackage ./category-encoders.nix { };
        torch-geometric = callPackage ./torch-geometric.nix { };
      };
    };
}
