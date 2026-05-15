{ config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    configPath = ".rasi";
    plugins = with pkgs; [ rofi-calc ];
  };

  home.file = {
    ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.sessionVariables.FLAKE}/users/nyaur/programs/graphical/hyprland/rofi/rofi";
  };

  home.persistence."/persist" = { files = [ ".cache/rofi3.druncache" ]; };
}
