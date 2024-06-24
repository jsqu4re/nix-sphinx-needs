{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; with pkgs.python3Packages; [
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