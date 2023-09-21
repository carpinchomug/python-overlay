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
              builtins.mapAttrs (_: package: package) config.packages // {
                # Fix matplotlib.
                # https://github.com/NixOS/nixpkgs/issues/80147#issuecomment-784857897
                # 
                # In addition to applying this override, set QT_PLUGIN_PATH as
                # QT_PLUGIN_PATH = with pkgs.qt5; "${qtbase}/${qtbase.qtPluginPrefix}";
                # in your nix shell.
                matplotlib = super.matplotlib.override { enableQt = true; };
              };
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
