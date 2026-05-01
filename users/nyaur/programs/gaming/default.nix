{ config, ... }:
{
  imports = [
    ./lutris.nix
    ./osu.nix
    ./minecraft.nix
  ];

  home.file = {
    ".gs.sh".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/gaming/scripts/gs.sh";
    ".ex.sh".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/gaming/scripts/ex.sh";
  };

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
