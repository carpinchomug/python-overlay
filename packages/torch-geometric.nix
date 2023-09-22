{ lib
, buildPythonPackage
, fetchPypi
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

  src = fetchPypi {
    inherit version;
    pname = "torch_geometric";
    sha256 = "sha256-RU/Qu8EooXpLnRUBC6n2bUjsjNcneZG4iKd3AmP6El0=";
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
