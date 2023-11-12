{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/4a729ce4b1fe5ec4fffc71c67c96aa5184ebb462";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      devShell.x86_64-linux =
        pkgs.mkShell {
          shellHook = ''
            export KICAD6_3DMODEL_DIR=${pkgs.kicad.libraries.packages3d}/share/kicad/3dmodels
          '';

          buildInputs = with pkgs; [
            kicad
            (python3.withPackages (ps: with ps; [
              pyscard
              (buildPythonPackage rec {
                pname = "easyeda2kicad";
                version = "0.6.3";
                src = fetchPypi {
                    inherit pname version;
                    sha256 = "sha256-4U1/gEEAPvKgSxIYtRUnpvCx/aZGYPb//qjqj+8JZO4=";
                };
                format = "pyproject";
                doCheck = false;
                propagatedBuildInputs = [ 
                  setuptools
                  pydantic
                  requests
                ];
              })
            ]))
          ];
        };
    };
}