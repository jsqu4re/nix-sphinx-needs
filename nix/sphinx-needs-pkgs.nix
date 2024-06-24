{ pkgs ? import <nixpkgs> { } }:
let
  sphinx-needs-pkgs =
    with pkgs;
    with pkgs.python3Packages;
    with pkgs.nodePackages;
    {
    sphinx-needs = callPackage ./sphinx-needs.nix{
      sphinx-data-viewer = sphinx-needs-pkgs.sphinx-data-viewer;
    };
    sphinxcontrib-test-reports = callPackage ./sphinxcontrib-test-reports.nix{
      sphinx-needs = sphinx-needs-pkgs.sphinx-needs;
    };
    sphinx-data-viewer = callPackage ./sphinx-data-viewer.nix{ };
    sphinx-simplepdf = callPackage ./sphinx-simplepdf.nix{ };
    sphinx-preview = callPackage ./sphinx-preview.nix{ };
    sphinx-immaterial = callPackage ./sphinx-immaterial.nix{
      nodejs = nodejs_18;
    };
    
    pkgs = [
      sphinx-needs-pkgs.sphinx-needs
      sphinx-needs-pkgs.sphinxcontrib-test-reports
      sphinx-needs-pkgs.sphinx-simplepdf
      sphinx-needs-pkgs.sphinx-preview
      sphinx-needs-pkgs.sphinx-immaterial
      matplotlib
      sphinx-copybutton
      sphinxcontrib-programoutput
    ];
  };
in 
  sphinx-needs-pkgs
