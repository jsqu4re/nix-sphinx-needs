{
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core
}:

buildPythonPackage rec {
  pname = "sphinx-data-viewer";
  version = "0.1.4";
  src = fetchFromGitHub {
    owner = "useblocks";
    repo = "sphinx-data-viewer";
    rev = "${version}";
    sha256 = "sha256-5hG8LqWz1Xu1yq6U9HjJAwtxy189EgPmqmZKptaBA+o=";
  };
  format = "pyproject";

  patches = [
    ./patches/sphinx-data-viewer-build-tool.patch
  ];

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
  ];
}