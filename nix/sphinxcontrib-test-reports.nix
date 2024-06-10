{
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  sphinx,
  sphinx-needs,
  sphinxcontrib-plantuml,
  lxml,
  pytest
}:

buildPythonPackage rec {
  pname = "sphinxcontrib-test-reports";
  version = "1.0.2";
  src = fetchFromGitHub {
    owner = "useblocks";
    repo = "sphinx-test-reports";
    rev = "${version}";
    sha256 = "sha256-rMySu6aBiTIRW4cISSNAZQV/DhqZxMM4yxfxCKLmrCw=";
  };

  doCheck = false;

  patches = [
    ./patches/sphinx-test-reports-dependencies.patch
  ];

  nativeBuildInputs = [
  ];

  propagatedBuildInputs = [
    setuptools
    sphinx
    sphinx-needs
    sphinxcontrib-plantuml
    lxml
    pytest
  ];
}