{
    buildPythonPackage,
    fetchFromGitHub,
    fetchNpmDeps,
    npmHooks,
    setuptools,
    setuptools-scm,
    poetry-core,
    nodejs,
    sphinx,
    markupsafe,
    pydantic,
    pydantic-extra-types,
    typing-extensions,
    appdirs,
    requests
}:
buildPythonPackage rec {
  pname = "sphinx-immaterial";
  version = "0.11.11";
  src = fetchFromGitHub {
    owner = "jbms";
    repo = "sphinx-immaterial";
    rev = "v${version}";
    sha256 = "sha256-Wcc3Bkp9i3L9gxNVZO/+8rvAGzH6I+XRO8kzbVYbT4k=";
  };

  env.npmDeps = fetchNpmDeps {
    name = "sphinx-immaterial-npm-deps";
    src = "${src}";
    hash = "sha256-NUKCAsn3Y9/gDkez5NgnCMKoQm45JSvR/oAepChDAJg=";
  };

  preBuild = ''
    npm run build
  '';

  format = "pyproject";

  nativeBuildInputs = [
    setuptools
    poetry-core
    setuptools-scm
    nodejs
    npmHooks.npmConfigHook
  ];

  propagatedBuildInputs = [
    sphinx
    markupsafe
    pydantic
    pydantic-extra-types
    typing-extensions
    appdirs
    requests
  ];
}
