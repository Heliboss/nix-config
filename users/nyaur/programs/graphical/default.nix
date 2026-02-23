{ pkgs, ... }: {
  imports = [
    ./firefox
    ./easyeffects
    ./pavucontrol.nix
    ./dolphin
    ./qbittorrent.nix
    ./discord.nix
    ./zathura.nix
  ];

  fonts.fontconfig.enable = true;

  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

  home.persistence."/persist" = { directories = [ ".local/share/icons" ]; };

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
    blueberry
    playerctl
    mpv
    vial
    feh
    qpwgraph
    keepassxc
    brave
  ];
}
