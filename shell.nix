{ pkgs ? import <nixpkgs> { } }:
let 
sphinx-needs-pkg = import ./nix/sphinx-needs-pkgs.nix;
in 
  pkgs.mkShell {
    packages = (sphinx-needs-pkg{inherit pkgs;}).pkgs;

    shellHook = ''
      # ...
    '';
  }