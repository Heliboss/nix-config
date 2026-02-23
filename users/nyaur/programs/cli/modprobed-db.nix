{ pkgs, ... }: {
  home.packages = with pkgs; [ modprobed-db ];

  home.persistence."/persist" = {
    files = [ ".config/modprobed.db" ".config/modprobed-db.conf" ];
  };
}
