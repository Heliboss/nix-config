{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bitwarden-desktop
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
    ];
  };
}
