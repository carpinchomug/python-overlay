{
  perSystem = { pkgs, ... }:
    let
      inherit (pkgs.python3Packages) callPackage;
    in
    {
      packages = {
        category-encoders = callPackage ./category-encoders.nix { };
        rustworkx = callPackage ./rustworkx.nix { };
        torch-geometric = callPackage ./torch-geometric.nix { };
      };
    };
}
