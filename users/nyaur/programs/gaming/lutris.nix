{
  pkgs,
  ...
}: {
  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/share/lutris"
    ];
  };

  home.packages = with pkgs; [
    lutris
  ];
}
