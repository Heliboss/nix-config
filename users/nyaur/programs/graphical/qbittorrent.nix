{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    qbittorrent
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/share/qBittorrent"
    ];
  };
}
