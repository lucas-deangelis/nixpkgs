{ lib
, buildPythonPackage
, pythonOlder
, fetchFromGitHub
, pytest-asyncio
, pytestCheckHook
, pyyaml
}:

buildPythonPackage rec {
  pname = "siobrultech-protocols";
  version = "0.12.0";

  disabled = pythonOlder "3.8";

  format = "setuptools";

  src = fetchFromGitHub {
    owner = "sdwilsh";
    repo = "siobrultech-protocols";
    rev = "refs/tags/v${version}";
    hash = "sha256-71iFZS5CLYXNw57psLXswNJKfvbeKOqSncLoSsNXqjc=";
  };

  nativeCheckInputs = [
    pytest-asyncio
    pytestCheckHook
    pyyaml
  ];

  pythonImportsCheck = [
    "siobrultech_protocols.gem.api"
    "siobrultech_protocols.gem.protocol"
  ];

  meta = {
    description = "A Sans-I/O Python client library for Brultech Devices";
    homepage = "https://github.com/sdwilsh/siobrultech-protocols";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ dotlambda ];
  };
}
