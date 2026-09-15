{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ prismlauncher ];

  home.file = {
    ".local/share/PrismLauncher/themes".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/gaming/prismlauncher/themes";
  };

  home.persistence."/persist" = {
    directories = [ ".local/share/PrismLauncher" ];
  };
}
