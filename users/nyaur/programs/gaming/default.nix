{
  pkgs,
  ...
}: {
  imports = [
    ./lutris.nix
    ./osu.nix
    ./minecraft.nix
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      {
        directory = ".local/share/Steam";
        method = "symlink"; # Bindfs is too slow for Steam games
      }
      ".local/share/anime-game-launcher"
    ];
  };
}
