{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    modprobed-db
  ];

  home.persistence."/persist/home/nyaur" = {
    files = [
      ".config/modprobed.db"
      ".config/modprobed-db.conf"
    ];
  };
}
