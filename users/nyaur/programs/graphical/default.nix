{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./easyeffects
    ./pavucontrol.nix
    ./dolphin
    ./qbittorrent.nix
    ./vesktop
    ./zathura
    ./mimeapps
  ];

  fonts.fontconfig.enable = true;

  xdg.mime.enable = true;

  home.persistence."/persist" = {
    directories = [ ".local/share/icons" ];
  };

  home.packages = with pkgs; [
    libnotify
    adwaita-icon-theme
    noto-fonts
    corefonts
    vista-fonts
    aporetic
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nmgui
    blueman
    playerctl
    mpv
    vial
    feh
    qpwgraph
    keepassxc
    brave
  ];
}
