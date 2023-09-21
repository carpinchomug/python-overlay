{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, tqdm
, numpy
, scipy
, jinja2
, requests
, pyparsing
, scikit-learn
, psutil
}:

let
  version = "2.3.1";
in
buildPythonPackage {
  inherit version;
  pname = "torch-geometric";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "pyg-team";
    repo = "pytorch_geometric";
    rev = "v${version}";
    sha256 = "sha256-69I54tVnPLz0GSpvgFxhiUkvrUqutRxfBi1TULjfqgw=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    tqdm
    numpy
    scipy
    jinja2
    requests
    pyparsing
    scikit-learn
    psutil
  ];

  meta = with lib; {
    description = "Graph Neural Network Library for PyTorch";
    homepage = "https://github.com/pyg-team/pytorch_geometric";
    icense = licenses.mit;
  };
}