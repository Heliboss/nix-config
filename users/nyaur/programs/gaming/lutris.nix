{ pkgs, ... }: {
  home.persistence."/persist" = { directories = [ ".local/share/lutris" ]; };

  home.packages = with pkgs; [ lutris ];
}
