{ pkgs, ... }: {
  imports = [
    ./firefox
    ./easyeffects
    ./pavucontrol.nix
    ./dolphin
    ./qbittorrent.nix
    ./discord.nix
    ./messenger.nix
    ./spotify.nix
    ./zathura.nix
  ];

  fonts.fontconfig.enable = true;

  home.persistence."/persist/home/nyaur" = {
    directories = [ ".local/share/icons" ];
  };

  home.packages = with pkgs; [
    libnotify
    adwaita-icon-theme
    noto-fonts
    corefonts
    vistafonts
    aporetic
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nmgui
    blueberry
    playerctl
    mpv
    vial
    feh
    qpwgraph
    keepassxc
  ];
}
