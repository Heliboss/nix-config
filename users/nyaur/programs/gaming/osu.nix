{ pkgs, ... }: {
  home.packages = with pkgs; [ osu-lazer-bin ];

  home.persistence."/persist" = { directories = [ ".local/share/osu" ]; };
}
