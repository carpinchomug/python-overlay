{ lib
, buildPythonPackage
, fetchFromGitHub
, rustPlatform
, setuptools-rust
, cargo
, rustc
}:

let
  pname = "rustworkx";
  version = "0.13.2";

  src = fetchFromGitHub {
    owner = "Qiskit";
    repo = "rustworkx";
    rev = "0.13.2";
    sha256 = "sha256-Xr+h0Pc0mbijzc9bjSvnCoQem4Y3jCBNNL8vkKbnUrc=";
  };

in
buildPythonPackage {
  inherit pname version src;

  format = "pyproject";

  cargoDeps = rustPlatform.fetchCargoTarball {
    inherit src;
    sha256 = "sha256-fCM8+DnHci1KIrcbX6adN7tLWPAMKEwGTKaKGD9IBeU=";
  };

  nativeBuildInputs = [
    setuptools-rust
    rustPlatform.cargoSetupHook
    cargo
    rustc
  ];

  meta = with lib; {
    license = licenses.asl20;
  };
}
