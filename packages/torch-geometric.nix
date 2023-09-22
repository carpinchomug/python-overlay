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

buildPythonPackage {
  pname = "torch-geometric";
  version = "2.3.1";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "pyg-team";
    repo = "pytorch_geometric";
    rev = "ff9fb3d7cdbaa2f2b8a848fb6cc5f4c3f465118c";
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
