{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "nix-sphinx-needs";
  version = "0.1.0";

  src = pkgs.lib.fileset.toSource {
    root = ./.;
    fileset = pkgs.lib.fileset.unions [
      ./docs
    ];
  };

  buildInputs = with pkgs; with pkgs.python3Packages; [
    sphinx-needs
    sphinxcontrib-test-reports
    sphinx-simplepdf
    sphinx-preview
    sphinx-immaterial
    matplotlib
    sphinx-copybutton
    sphinxcontrib-programoutput
  ];

  buildPhase = ''
    sphinx-build docs out
  '';

  installPhase = ''
    mkdir -p $out
    mv out $out
  '';
}
