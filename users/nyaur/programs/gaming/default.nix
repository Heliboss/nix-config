{
  imports = [ ./lutris.nix ./osu.nix ./minecraft.nix ];

  home.persistence."/persist" = {
    directories = [
      ".local/share/Steam"
      # Directories used by games
      ".config/bitburner"
      ".config/NecroDancer"
      ".local/share/Replicube"
      ".local/share/Paradox Interactive"
      ".local/share/Terraria"
    ];
  };
}
