{ pkgs, ... }:
let
  caprine-override = pkgs.caprine.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "heliboss";
      repo = "caprine";
      rev = "f753f68";
      hash = "sha256-hNYGsWGmPV13bZvnngesA7pIgysqI2wFA0kUlAPZ+xY=";
    };
  });
in {
  home.packages = [ caprine-override ];

  home.persistence."/persist" = { directories = [ ".config/Caprine" ]; };
}
