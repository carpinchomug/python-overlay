{ lib
, buildPythonPackage
, fetchPypi
, numpy
, pandas
, patsy
, scikit-learn
, scipy
, statsmodels
}:

let
  version = "2.6.2";
in
buildPythonPackage {
  inherit version;
  pname = "category-encoders";

  src = fetchPypi {
    inherit version;
    pname = "category_encoders";
    sha256 = "sha256-8Bq6qOb2MHVtZ7gcvqZzASt3WaeP2q2josY/AgMzpdY=";
  };

  propagatedBuildInputs = [
    numpy
    pandas
    patsy
    scikit-learn
    scipy
    statsmodels
  ];
}