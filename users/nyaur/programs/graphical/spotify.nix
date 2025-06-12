{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    spotify
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".config/spotify"
    ];
  };
}
