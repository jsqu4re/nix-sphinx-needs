{
    buildPythonPackage,
    fetchFromGitHub,
    setuptools,
    beautifulsoup4,
    libsass,
    weasyprint,
    sphinx
}:

buildPythonPackage rec {
  pname = "sphinx-simplepdf";
  version = "1.5.0";
  src = fetchFromGitHub {
    owner = "useblocks";
    repo = "sphinx-simplepdf";
    rev = "${version}";
    sha256 = "sha256-OSCpPgd+3qDyo4lcIiMh2QylEvsw5Tmn4jhmeY/b6ho=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    beautifulsoup4
    libsass
    weasyprint
    sphinx
  ];
}