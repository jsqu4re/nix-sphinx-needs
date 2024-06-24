{
  description = "A basic sphinx needs flake";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs?ref=nixos-unstable;
    flake-utils.url = "github:numtide/flake-utils";
    nix-needs.url = "github:jsqu4re/nix-needs";
  };

  outputs = { self, nixpkgs, flake-utils, nix-needs, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ nix-needs.overlays.default ]; 
          };
        in
        {
          devShells.default = import ./shell.nix { inherit pkgs; };
          packages.default = import ./build.nix { inherit pkgs; };
        }
      );
}
