{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    discord
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".config/discord"
    ];
  };
}
