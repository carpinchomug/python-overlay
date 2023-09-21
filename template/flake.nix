{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    python-overlay = {
      url = "github:carpinchomug/python-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { pkgs, system, ... }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [
            inputs.python-overlay.overlays.default
          ];
          config = { };
        };

        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              (python3.withPackages (ps: with ps; [
                numpy
                scipy
                pandas
                matplotlib
                torch
                torch-geometric
              ]))
            ];
          };
        };
      };
    };
}
