{ pkgs ? import <nixpkgs> { } }:
let
  sphinx-needs-pkgs =
    with pkgs;
    with pkgs.python3Packages;
    with pkgs.nodePackages;
    {
    sphinx-needs = (import ./sphinx-needs.nix{
      inherit buildPythonPackage;
      inherit fetchFromGitHub;
      inherit poetry-core;
      inherit setuptools;
      inherit jsonschema;
      inherit requests;
      inherit requests-file;
      inherit sphinx;
      inherit sphinxcontrib-jquery;
      inherit sphinxcontrib-plantuml;
      inherit sphinx-design;
      sphinx-data-viewer = sphinx-needs-pkgs.sphinx-data-viewer;
    });
    sphinxcontrib-test-reports = (import ./sphinxcontrib-test-reports.nix{
      inherit buildPythonPackage;
      inherit fetchFromGitHub;
      inherit setuptools;
      inherit sphinx;
      sphinx-needs = sphinx-needs-pkgs.sphinx-needs;
      inherit sphinxcontrib-plantuml;
      inherit lxml;
      inherit pytest;
    });
    sphinx-data-viewer = (import ./sphinx-data-viewer.nix{
      inherit buildPythonPackage;
      inherit fetchFromGitHub;
      inherit poetry-core;
    });
    sphinx-simplepdf = (import ./sphinx-simplepdf.nix{
      inherit buildPythonPackage;
      inherit fetchFromGitHub;
      inherit setuptools;
      inherit beautifulsoup4;
      inherit libsass;
      inherit sphinx;
      inherit weasyprint;
    });
    sphinx-preview = (import ./sphinx-preview.nix{
      inherit buildPythonPackage;
      inherit fetchFromGitHub;
      inherit poetry-core;
    });
    sphinx-immaterial = (import ./sphinx-immaterial.nix{
      inherit lib;
      inherit buildPythonPackage;
      inherit fetchFromGitHub;
      inherit fetchNpmDeps;
      inherit npmHooks;
      inherit setuptools;
      inherit setuptools-scm;
      inherit nodejs_18;
      inherit poetry-core;
      inherit sphinx;
      inherit pydantic;
      inherit pydantic-extra-types;
      inherit appdirs;
    });
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
