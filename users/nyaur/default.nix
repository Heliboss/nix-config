{
  inputs,
  ...
}: {
  imports = [
    inputs.impermanence.homeManagerModules.impermanence
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "nyaur";
    homeDirectory = "/home/nyaur";
    stateVersion = "24.11"; # Don't change
  };

  home.persistence."/persist/home/nyaur" = {
    allowOther = true; # Allows others to access files through the bind mounted directories. Useful for sudo, Docker, etc. Requires programs.fuse.userAllowOther = true.
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
    ];
    defaultDirectoryMethod = "symlink"; # Symlinks are faster than bindfs
  };
}
