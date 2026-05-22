{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ krita ];

  home.persistence."/persist" = {
    directories = [ ".local/share/krita" ];
    files = [
      {
        file = ".config/kritarc";
        method = "symlink";
      }
      {
        file = ".config/kritadisplayrc";
        method = "symlink";
      }
    ];
  };

  home.file = {
    ".config/kritashortcutsrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/creativity/krita/kritashortcutsrc";

  };
}
