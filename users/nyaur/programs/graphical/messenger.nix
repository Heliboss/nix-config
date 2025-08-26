{
  lib,
  pkgs,
  ...
}: let
  caprine-override = pkgs.caprine.overrideAttrs (old: rec {
    src = pkgs.fetchFromGitHub {
      owner = "heliboss";
      repo = "caprine";
      rev = "fb5c769";
      hash = "sha256-G77Rmo43KJWxt/mN9/hWNfCPAmBEsL9w65i40XuS0PU=";
    };
  });
in {
  home.packages = [
    caprine-override
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".config/Caprine"
    ];
  };
}
