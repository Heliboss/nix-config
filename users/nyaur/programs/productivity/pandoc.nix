{
  pkgs,
  ...
}: let
  eisvogel = pkgs.fetchFromGitHub {
    owner = "Wandmalfarbe";
    repo = "pandoc-latex-template";
    rev = "v3.1.0";
    hash = "sha256-jwGQMlEGcCOhlHnYAcatJBxB5bquQGLW0U0s8vjf5rI=";
  };
in {
  programs.pandoc = {
    enable = true;
    templates = {
      "eisvogel.latex" = "${eisvogel}/template-multi-file/eisvogel.latex";
      "eisvogel.beamer" = "${eisvogel}/template-multi-file/eisvogel.latex";
    };
  };
}
