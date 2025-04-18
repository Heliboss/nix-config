{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    pavucontrol
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/state/wireplumber"
    ];
  };
}
