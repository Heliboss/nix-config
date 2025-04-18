{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    devenv
  ];

  home.persistence."/persist/home/nyaur" = {
    directories = [
      ".local/share/devenv"
    ];
  };
}
