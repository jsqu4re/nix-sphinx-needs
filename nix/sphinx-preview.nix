{
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core
}:

buildPythonPackage rec {
  pname = "sphinx-preview";
  version = "0.1.1";
  src = fetchFromGitHub {
    owner = "useblocks";
    repo = "sphinx-preview";
    rev = "${version}";
    sha256 = "sha256-CYqNRn4R2iT1UP7nIBMtoAs4EtutI+ASzPk57Cs98Bo=";
  };
  format = "pyproject";

  patches = [
    ./patches/sphinx-preview-build-tool.patch
  ];

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
  ];
}