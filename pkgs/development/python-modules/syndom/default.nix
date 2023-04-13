{ lib
, fetchFromGitLab
, buildPythonPackage
, pkg-config
, meson
, ninja
, isPy3k
, pugixml
, fmt
, html-tidy
, pybind11
}:

buildPythonPackage rec {
  pname = "syndom";
  version = "unstable-2023-03-25";

  format = "other";

  src = fetchFromGitLab {
    owner = "gabmus";
    repo = "syndication-domination";
    rev = "75920321062d682437f3fb0319dad227d8b18f6c";
    sha256 = "sha256-fOlE9CsNcmGkVBXaqYHxLDWB8voeRp46+dZYIJIwg7o=";
  };

  # Python 2.x is not supported.
  disabled = !isPy3k;

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    pugixml
    fmt
    html-tidy
    pybind11
  ];

  meta = with lib; {
    homepage = "https://gitlab.com/gabmus/syndication-domination";
    description = "An RSS/Atom parser";
    license = licenses.gpl3Plus;
  };
}
