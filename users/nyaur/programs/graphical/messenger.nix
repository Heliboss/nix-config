{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    caprine
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".config/Caprine"
    ];
  };
}
