{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    libreoffice-fresh
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".config/libreoffice"
    ];
  };
}
