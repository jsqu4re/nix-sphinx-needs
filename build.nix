{ pkgs ? import <nixpkgs> { } }:
let
  sphinx-needs-pkgs = import ./nix/sphinx-needs-pkgs.nix { inherit pkgs; };
in
  pkgs.stdenv.mkDerivation rec {
    pname = "nix-sphinx-needs-example";
    version = "0.1.0";

    src = pkgs.lib.fileset.toSource {
      root = ./.;
      fileset = pkgs.lib.fileset.unions [
        ./docs
      ];
    };

    buildInputs = sphinx-needs-pkgs.pkgs;

    buildPhase = ''
      sphinx-build docs out
    '';

    installPhase = ''
      mkdir -p $out
      mv out $out
    '';
  }
