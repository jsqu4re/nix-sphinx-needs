{
  description = "A basic sphinx needs flake";

  inputs = {
    # nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nixpkgs-23-11.url = "github:nixos/nixpkgs?ref=nixos-23.11";
    nixpkgs.url = github:nixos/nixpkgs?ref=nixos-unstable;
    flake-utils.url = "github:numtide/flake-utils";
    nix-needs.url = "github:jsqu4re/nix-needs";
  };

  outputs = { self, nixpkgs, flake-utils, nix-needs, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { 
            overlays = [ nix-needs.overlays.sphinx-needs ]; 
          };
        in
        {
          devShells.default = import ./shell.nix { inherit pkgs; };
          packages.default = import ./build.nix { inherit pkgs; };
        }
      );
}
