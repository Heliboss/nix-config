{
  config,
  pkgs,
  ...
}: let
  arkenfox = pkgs.fetchFromGitHub {
    owner = "arkenfox";
    repo = "user.js";
    rev = "135.0";
    hash = "sha256-21DoV4SMueMFRHMsvfsPfQIOtsvRWNY06rE4gB7xFnc=";
  };
in {
  home.file = {
    ".tridactylrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/firefox/extensions/.tridactylrc";
  };

  programs.firefox.profiles.nyaur.extraConfig = ''
    ${builtins.readFile "${arkenfox}/user.js"}
    ${builtins.readFile ./user-overrides.js}
  '';
}
