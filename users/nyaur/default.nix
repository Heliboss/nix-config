{ inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "nyaur";
    homeDirectory = "/home/nyaur";
    stateVersion = "24.11"; # Don't change
  };

  home.persistence."/persist" = {
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Games"
      "Applications"
      "Source"
      "Projects"
      "Public"
    ];
  };
}
