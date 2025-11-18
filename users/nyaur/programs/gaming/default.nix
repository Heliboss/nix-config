{
  imports = [ ./lutris.nix ./osu.nix ./minecraft.nix ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      {
        directory = ".local/share/Steam";
        method = "symlink"; # Bindfs is too slow for Steam games
      }
      # Directories used by games
      {
        directory = ".config/bitburner";
        method = "bindfs";
      }
      ".config/NecroDancer"
      {
        directory = ".local/share/Replicube";
        method = "bindfs";
      }
    ];
  };
}
