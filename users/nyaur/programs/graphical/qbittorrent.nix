{ pkgs, ... }: {
  home.packages = with pkgs; [ qbittorrent ];

  home.persistence."/persist" = {
    directories = [ ".local/share/qBittorrent" ];
  };
}
