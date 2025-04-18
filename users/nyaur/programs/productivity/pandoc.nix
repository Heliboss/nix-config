{
  pkgs,
  ...
}: let
  eisvogel = pkgs.fetchzip {
    url = "https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v3.1.0/Eisvogel-3.1.0.zip";
    hash = "sha256-THszG9id3Ditrf4f0csu4Sl75P90ZkXENbGytGjp7O8=";
  };
in {
  programs.pandoc = {
    enable = true;
    templates = {
      "eisvogel.latex" = "${eisvogel}/eisvogel.latex";
      "eisvogel.beamer" = "${eisvogel}/eisvogel.beamer";
    };
  };
}
