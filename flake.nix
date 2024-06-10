{
  description = "A basic sphinx needs flake";

  inputs = {
    # nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nixpkgs-23-11.url = "github:nixos/nixpkgs?ref=nixos-23.11";
    nixpkgs.url = github:nixos/nixpkgs?ref=nixos-unstable;
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells.default = import ./shell.nix {
            inherit pkgs;
          };
        }
      );
}
