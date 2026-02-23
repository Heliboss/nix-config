{ pkgs, ... }: {
  home.packages = with pkgs; [ devenv ];

  home.persistence."/persist" = { directories = [ ".local/share/devenv" ]; };
}
