{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.qtsvg
  ];

  home.persistence."/persist/home/nyaur" = {
    files = [
      ".config/kdeglobals"
    ];
  };
}
