{
    buildPythonPackage,
    fetchFromGitHub,
    poetry-core,
    setuptools,
    jsonschema,
    requests,
    requests-file,
    sphinx,
    sphinx-data-viewer,
    sphinxcontrib-jquery,
    sphinxcontrib-plantuml,
    sphinx-design
}:

buildPythonPackage rec {
  pname = "sphinx-needs";
  version = "2.1.0";
  src = fetchFromGitHub {
    owner = "useblocks";
    repo = "sphinx-needs";
    rev = "${version}";
    sha256 = "sha256-hREar5JMv8BZtRXlMU/bELKilj3UNWBcf+hFMvhXJkI=";
  };
  format = "pyproject";

  patches = [
    ./patches/requests-file-version.patch
  ];

  nativeBuildInputs = [
    poetry-core
    setuptools
  ];

  propagatedBuildInputs = [
    jsonschema
    requests
    requests-file
    sphinx
    sphinx-data-viewer
    sphinxcontrib-jquery
    sphinxcontrib-plantuml
    sphinx-design
  ];
}