{ lib
, aiohttp
, aioresponses
, buildPythonPackage
, click
, dateparser
, fetchFromGitHub
, marshmallow-dataclass
, poetry-core
, pyjwt
, pythonOlder
, pytest-asyncio
, pytestCheckHook
, tabulate
}:

buildPythonPackage rec {
  pname = "renault-api";
  version = "0.1.6";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "hacf-fr";
    repo = pname;
    rev = "v${version}";
    sha256 = "0v9a8p0ynikqzg7vvinvik5gjvsc5nrfqkq528mhcw7y4hmj8ndm";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    aiohttp
    click
    dateparser
    marshmallow-dataclass
    pyjwt
    tabulate
  ];

  checkInputs = [
    aioresponses
    pytest-asyncio
    pytestCheckHook
  ];

  pythonImportsCheck = [ "renault_api" ];

  meta = with lib; {
    description = "Python library to interact with the Renault API";
    homepage = "https://github.com/hacf-fr/renault-api";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
