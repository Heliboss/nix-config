{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    vale
    vale-ls
  ];

  home.file = {
    ".config/vale/.vale.ini".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/neovim/vale/.vale.ini";
    ".local/share/vale/styles/config/vocabularies/custom/accept.txt".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/cli/neovim/vale/accept.txt";
  };

  home.persistence."/persist" = {
    directories = [ ".local/share/vale" ];
  };
}
