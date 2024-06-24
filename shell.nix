{ pkgs ? import <nixpkgs> { } }:
let 
sphinx-needs-pkg = import ./nix/sphinx-needs-pkgs.nix;
in 
  pkgs.mkShell {
    packages = [
      sphinx-needs
      sphinxcontrib-test-reports
      sphinx-simplepdf
      sphinx-preview
      sphinx-immaterial
      matplotlib
      sphinx-copybutton
      sphinxcontrib-programoutput
    ];

    shellHook = ''
      # ...
    '';
  }