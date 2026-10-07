{
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "nyaur";
    homeDirectory = "/home/nyaur";
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
      ".local/share/waydroid"
      ".cache/nix"
    ];
  };
}
