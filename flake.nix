{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        flake-parts.flakeModules.easyOverlay
        ./packages
      ];
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { config, pkgs, ... }: {
        overlayAttrs = {
          python3 = pkgs.python3.override {
            packageOverrides = self: super:
              builtins.mapAttrs (_: package: package) config.packages // { };
          };
        };
      };

      flake.templates = {
        shell = {
          path = ./template;
        };
      };
    };
}
