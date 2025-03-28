{
  lib,
  fetchFromGitHub,
  ocamlPackages,
  menhir,
}:

ocamlPackages.buildDunePackage rec {
  pname = "obelisk";
  version = "0.8.0";
  duneVersion = "3";
  src = fetchFromGitHub {
    owner = "Lelio-Brun";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-neN1s9GG+GKTs1iksHGWKGvWQrZOLrXyj9XJw9XLiNQ=";
  };

  strictDeps = true;

  nativeBuildInputs = [ menhir ];
  buildInputs = with ocamlPackages; [ re ];

  meta = {
    description = "Simple tool which produces pretty-printed output from a Menhir parser file (.mly)";
    mainProgram = "obelisk";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.vbgl ];
    homepage = "https://github.com/Lelio-Brun/Obelisk";
  };
}
