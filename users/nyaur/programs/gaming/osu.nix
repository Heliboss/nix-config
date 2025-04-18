{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    osu-lazer-bin
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/share/osu"
    ];
  };
}
