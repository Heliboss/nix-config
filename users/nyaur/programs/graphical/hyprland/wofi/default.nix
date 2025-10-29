{ config, ... }: {
  programs.wofi.enable = true;

  home.file = {
    ".config/wofi/style.css".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/wofi/style.css";
  };

  home.persistence."/persist/home/nyaur" = { files = [ "/.cache/wofi-drun" ]; };
}
